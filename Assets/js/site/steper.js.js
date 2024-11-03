// plugin definition
(($) => {
	$.thousand = (x) => {
		x = x.toString();
		var ptn = /(-?\d+)(\d{3})/;
		while (ptn.test(x))
			x = x.replace(ptn, "$1,$2");
		return x;
	},
		$.RowSelection = (t, arr) => {
			let d = $(t).closest('tr').attr('data-id');
			let rw = $(t).closest('tr');
			$(rw).toggleClass('highLighted');
			if ($(rw).hasClass('highLighted')) {
				if (Array.isArray(arr)) {
					if (!arr.includes(d)) {
						arr.push(d);
						if ($(rw).find('[data-check]')) {
							$(rw).find('[data-check]').prop("checked", true);
						}
					}
				}
			}
			return [d, rw];
		},
		$.unSelectRow = (arr, element, check) => {
			if (!$(check).hasClass('highLighted')) {
				const index = arr.indexOf(element);
				arr.splice(index, 1)
				if ($(check).find('[data-check]')) {
					$(check).find('[data-check]').prop("checked", false);
				}
			}
		},
		$.referenceGenerator = (length = 7) => {
			let result = '';
			const characters = '0123456789';
			const charactersLength = characters.length;
			let counter = 0;
			while (counter < length) {
				result += characters.charAt(Math.floor(Math.random() * charactersLength));
				counter += 1;
			}
			return result;
		},
		$.VoucherObject = ($txn, $credits, $debits) => {
			let jsn = {
				"txn": $txn,
				"credits": [{
					"p_vote": $credits.p_vote,
					"p_detail": $credits.p_detail,
					"p_amt": $credits.p_amt
				}],
				"debits": $debits
			}
			return jsn;
		},
		$.validate = (ev) => {
			let t = ev.target;
			let fm = $(t).closest('form');
			let inp = $(fm).find("input , textarea, select ");
			let e_msg = [];
			for (let Fm_input of inp) {
				let typ_ck = $(Fm_input).attr('type');
				let i_vl = $(Fm_input).val();
				if (typ_ck != 'hidden') {
					let nam = $(Fm_input).attr('id');
					let txt = $(`label[for=${nam}]`).text();
					let lab = txt.trim().charAt(0).toUpperCase() + txt.slice(1);
					let ll = lab.split("(") ? lab.split("(")[0] : lab;
					if (i_vl == '' && $(Fm_input).prop("required")) {
						$(Fm_input).css("border", "1.2px solid red");
						e_msg.push(lab);
						$(Fm_input).next().remove("p");
						$(Fm_input).after(`<p data-error_msg>${ll} is required  <p>`);
					} else {
						$(Fm_input).next().remove("p");
						$(Fm_input).css("border", "1.2px solid #81808048");
					}
				}
			}
			return e_msg.length;
		},
		$.clearForm = (ev) => {
			let t = ev.target;
			let fm = $(t).closest('form');
			$(fm).find("input , textarea, select ").val('');
		},
		$.sendVoucherRequest = (arrSum, txnType, reference, txtDate, description, acc_Credit, amount, postUrl, ev = null) => {
			if (arrSum.length > 0) {
				let obj = $.VoucherObject(
					{ "p_trtype": txnType, "p_tref": reference, "p_tdate": txtDate, "p_tdescription": description }
					, { "p_vote": acc_Credit, "p_detail": description, "p_amt": amount }, arrSum);

				if ($.validate(ev) <= 0) {
					$.clearForm(ev);
					$.post(`${postUrl}`, { "transaction": obj }, function (data) {
						if (data.returnMessage) {
							$("[data-suc_msg]").addClass("active_err_msg").find("[data-success_msg]").html(data.returnMessage);
							setTimeout(() => {
								$("[data-suc_msg]").removeClass("active_err_msg");
							}, 2000);
						} else {
							$("[data-suc_msg]").addClass("active_err_msg").find("[data-e_msg]").html(data.returnMessage);
							setTimeout(() => {
								$("[data-suc_msg]").removeClass("active_err_msg")
							}, 2000);
						}

					}, 'json');
				}
			} else {
				$("[data-suc_msg]").addClass("active_err_msg").find("[data-e_msg]").html("Hello some required data is missing");
				setTimeout(() => {
					$("[data-suc_msg]").removeClass("active_err_msg");
				}, 2000);
			}
		},
		$.objectMap = (accountCode, description, amount) => {
			return { "p_vote": accountCode, "p_detail": description, "p_amt": amount };
		}

})(jQuery);
// end of plugin definition
$(document).ready(function () {

	// start of accounting module script
	let recs = [];
	let ur = '';
	$(document).on("click", "#reconcile", function (e) {
		let id = $(this).closest("tr").attr("data-txn");
		ur = $(this).closest("tr").attr("data-url");
		recs.push(id);
	});

	$(document).on("click", "[data-reco]", function (e) {
		e.preventDefault();
		if (recs.length > 0) {
			$.post(`${ur}`, { data: recs }, function (data) {
				$("[data-msg_div]").html("Successfully").css("background", "teal").show();
				setTimeout(() => {
					$("[data-msg_div]").hide();
				}, 1000);
			})
		} else {
			$("[data-msg_div]").html("AtLeast one account should selected").css("background", "red").show();
			setTimeout(() => {
				$("[data-msg_div]").hide();
			}, 1000);
		}
	})


	//other-income
	$(document).on("click", "[data-push_data_income]", function (e) {
		e.preventDefault();
		let bnk = $("#dynamicmodel-b_banker").val();
		let dte = $("#dynamicmodel-date_created").val();
		let ref = $("#dynamicmodel-p_tref").val();
		let particular = $("#dynamicmodel-particulars").val();
		let vote = $("#dynamicmodel-vote").val();
		let amt = $("#dynamicmodel-amount").val();
		let payer = $("#dynamicmodel-paid_by").val();
		let receiver = $("#dynamicmodel-received_by").val();
		let ttype = 'other_income';
		let action = 'call-voucher-procedure';
		if ($.validate(e) <= 0) {
			$.sendVoucherRequest([$.objectMap(bnk, particular, amt)], ttype, ref, dte, particular, vote, amt, action, e)
			window.location.href = 'view-other-income';
		}
	});


	$(document).on("click", "[data-billing]", function (e) {
		let crt = e.target;
		// implements validation rules
		let inputs = $(e).closest('form').find("[input]");
		// end of validation rules
		$(e).closest('form').trigger('submit');
	});


	//ind invce


	//bursary
	$(document).on("click", "[data-push_data_bursary]", function (e) {
		e.preventDefault();
		let trTpe = $("#dynamicmodel-p_trtype").val();
		let studAcc = $("#dynamicmodel-student_account").val();
		let dte = $("#dynamicmodel-p_date").val();
		let desc = $("#dynamicmodel-p_tdescription").val();
		let l_amt = $("#dynamicmodel-less_amount").val();
		let busAcc = $("#dynamicmodel-trans_type").val();
		let ttype = trTpe;
		let ref = "bursary";
		let action = "call-bursary-procedure";

		$.sendVoucherRequest([$.objectMap(busAcc, desc, l_amt)], ttype, ref, dte, desc, studAcc, l_amt, action)

	})




	//selecting banks basing on the selected recordSource


	$(document).on("change", "#dynamicmodel-p_trtype", function () {
		$type = $(this).val()
		// alert($type)
		$.post(`bnk-discount?ttype=${$type}`, function (data) {
			$("#dynamicmodel-trans_type").html(data)
		})
	})

	// implementing masking
	// $(document).on("keyup","#vamount",function(e){
	// 	$(e.target).prop("value", function(_, val) {
	// 		return val.replace(/(,|\D)(?=\1)|^[,\D]|[^,\d]$/g, "");
	// 	  })
	// })


	// end of masking


	$(document).on('click', '[data-buttons]', function (e) {
		let t = $(this).attr('data-id')
		if (t === 'reset') {
			$(this).closest('form').find(':input')
				.not(':button, :submit, :reset, :hidden')
				.val('')
				.prop('checked', false)
				.prop('selected', false);
		}
		if (t === "add") {
			e.preventDefault();
			let description = $("#voteDetail").val();
			let ac_amount = $("#vamount").val().replace(/,/g, "");
			let d_amount = $("#vote_amount").val().replace(/,/g, "");
			let accode = $("#vote").val();
			let balance = $("#vamount").val().replace(/,/g, "");

			$(".distributed").html($.thousand(d_amount));
			if (ac_amount >= d_amount) {
				balance = (ac_amount - d_amount);
				$(".Balance").html($.thousand(ac_amount - grand_total));
			}
			if ($.validate(e) <= 0) {
				if ((grand_total + parseInt(d_amount)) <= ac_amount) {
					voucher_summary.push({ "p_vote": accode, "p_detail": description, "p_amt": d_amount });
					grand_total = voucher_summary.reduce((a, r) => a + parseInt(r.p_amt), 0);
					$(".Balance").html($.thousand(ac_amount - grand_total));
				} else {
					$("[data-suc_msg]").addClass("active_err_msg").find("[data-e_msg]").html("Hello some required data is missing");
					setTimeout(() => {
						$("[data-suc_msg]").removeClass("active_err_msg");
					}, 2000);

				}
				$($("#vote_amount")).val(null)
				$(".distributed").html(null);
				if (voucher_summary) {
					bindVoucher(voucher_summary);
				}
			}
		}
	})

	$(document).on("click", "[button-reset]", function (e) {
		e.preventDefault()
		let t = $(this).prop('type')
		if (t == "reset") {
			$(this).closest('form').find(':input')
				.not(':button, :submit, :reset, :hidden')
				.val('')
				.prop('checked', false)
				.prop('selected', false);
		}
	})

	$(document).on("click", "#generate", function (e) {
		e.preventDefault();
		$("#dynamicmodel-p_tref").val($.referenceGenerator(5))
	})

	$(document).on("click", "#revoke", function (e) {
		e.preventDefault();
		$("#dynamicmodel-p_tref").val('')
	})

	$(document).on("change", "#examscorecomments-score", function (e) {
		let v = $(this).val();
		console.log(v)
		if (v > 6) {
			$(this).val(v);
		} else {
			this.val(v);
		}
	})

	// setTimeout(() =>{
	// 	document.getElementById('customized-popup').style.display='none';
	// },3000)

	// $(document).on("keyup","[data-narration]",function(e){
	// 	let va = $(this).val();
	// 	$("#voteDetail").val(va);
	// });

	$(document).on("keyup", "#vamount", function (e) {
		let amount = $(this).val();
		if (amount)
			$(".Balance").html($.thousand(amount));
		else
			$(".Balance").html('');
	})

	let voucher_summary = [];
	let grand_total = 0;
	let current_balance = 0;
	$(document).on("keyup", "#vote_amount", function (e) {

		let description = $("#voteDetail").val();
		let ac_amount = $("#vamount").val().replace(/,/g, "");
		let d_amount = $("#vote_amount").val().replace(/,/g, "");
		let accode = $("#vote").val();
		let balance = $("#vamount").val();
		$(".distributed").html($.thousand(d_amount));

		if (e.keyCode == 13 && $.validate(e) <= 0) {
			let bal = ac_amount - voucher_summary.reduce((a, r) => a + parseInt(r.p_amt), 0);
			if (d_amount <= bal) {
				voucher_summary.push({ "p_vote": accode, "p_detail": description, "p_amt": d_amount });
				grand_total = voucher_summary.reduce((a, r) => a + parseInt(r.p_amt), 0);
				bal = ac_amount - grand_total;
				$(".Balance").html($.thousand(ac_amount - grand_total));
			}
			else {
				alert("out of budget")
			}
			$($("#vote_amount")).val(null)
			$(".distributed").html(null);
			if (voucher_summary) {
				bindVoucher(voucher_summary);
			}
		}

	});

	// deletion item
	$(document).on("click", "[data-delete_voucher]", function (e) {
		e.preventDefault();
		let ind = $(this).attr('data-index');
		if (ind) {
			let v = voucher_summary.splice(ind, 1);
			bindVoucher(voucher_summary);
			let newbl = voucher_summary.reduce((a, r) => a + parseInt(r.p_amt), 0)
			let con = $("#vamount").val().replace(/,/, '');
			current_balance = (con - newbl);
			$(".Balance").html(current_balance);

		}
	})

	// pushing json object
	// voucher-payment
	$(document).on("click", "[data-push_data_general_voucher]", function (e) {
		e.preventDefault();
		let action = $(this).attr('data-action');
		let acCr = $("#acCr").val();
		let voteAmount = $("#vamount").val().replace(/,/g, "");
		let narration = $("#narration").val();
		let txnDate = $("#txnDate").val();
		let chequeRef = $("#cheque").val();
		let txnType = $(this).attr('data-type');
		$.sendVoucherRequest(voucher_summary, txnType, chequeRef, txnDate, narration, acCr, voteAmount, action, e);
	});

	$(document).on("click", "[data-g_journal]", function (e) {
		e.preventDefault();
		let $this = $(this);
		let action = $this.attr('data-action');
		let txnType = $this.attr('data-type');
		let txd = $("#txnDate").val();
		let ref = $("#reference").val();
		let dtl = $("#detail").val();
		let ac = $("#c_ac").val();
		let dc = $("#d_ac").val();
		let atm = $("#amount").val().replace(/,/g, "");
		$.sendVoucherRequest([$.objectMap(dc, dtl, atm)], txnType, ref, txd, dtl, ac, atm, action, e);
	})


	// export to excel
	$(document).on("click", '[excel-export]', function () {
		let t = $(this).attr('excel-export');
		let fn = $(this).attr('excel-name')
		$(t).table2excel({
			exclude: ".no_export",
			filename: `${fn}`,
			preserveColors: true,
			fileext: ".xls",
			exclude_img: true,
			exclude_links: true,
			exclude_inputs: true,
		});
	})



	$(document).on('change', '#dynamicmodel-wht', function () {
		let va = $(this).val();
		let code = $("#dynamicmodel-whtvote").val();
		grand_total = $("#vamount").val().replace(/,/g, "");

		if (grand_total) {
			let whtamount = (va * grand_total)
			let p = (va * 100)
			// grand_total = voucher_summary.reduce((a,r)=> a + parseInt(r.p_amt),0);

			voucher_summary.push({ "p_vote": code, "p_detail": `${p}% Withholding tax`, "p_amt": whtamount })
			$(".Balance").html($.thousand(grand_total - whtamount));
			console.log(JSON.parse(voucher_summary))
			bindVoucher(voucher_summary);
		}
	})


	function bindVoucher(arr) {
		let temp = '';
		let total = null;
		let thousandTotal = '';
		if (Array.isArray(arr)) {
			if (arr) {
				for (let [i, col] of arr.entries()) {
					let am = $.thousand(col.p_amt);
					total = (total + parseInt(col.p_amt));
					thousandTotal = $.thousand(total)
					temp += `
				<tr>
				<td>${col.p_vote}</td>
				<td>${col.p_detail}</td>
				<td colspan="2">${am}</td>
				<td data-delete_voucher data-index=${i} >Delete</td>
				<tr>`;
				}
				temp += `
			<tr>
			<td colspan="2">Total</td>
			<td colspan="2">${thousandTotal}</td>
			</tr>
			`;
				$("[data-voucher_summary]").html(temp);
			}
		}
	}

	// filter subjects
	// end filter subjects
	$(document).on("click", "[data-gen]", function (e) {
		var $this = $(this);
		let ch = $this.attr('data-gen');
		if (ch === 'generate')
			$("[data-ref]").val($.referenceGenerator())
		if (ch === 'revoke')
			$("[data-ref]").val('')
	})

	let class_allocation = [];
	$(document).on("click", "[data-select_classes]", function (e) {
		let t = e.target;
		let rt = $.RowSelection(t, class_allocation);
		$.unSelectRow(class_allocation, rt[0], rt[1]);
		if (class_allocation)
			$("#coresubject-classes").val(JSON.stringify(class_allocation));
	})

	// select subjects
	let selectSubjects = [];
	$(document).on("click", "#subject_data", function (e) {
		let t = e.target;
		let rt = $.RowSelection(t, selectSubjects)
		$.unSelectRow(selectSubjects, rt[0], rt[1])
		if (selectSubjects)
			$("#studentsubjects-subjects").val(JSON.stringify(selectSubjects));
	})

	let selectStudents = [];
	$(document).on("click", "#students_data", function (e) {
		let t = e.target;
		let rt = $.RowSelection(t, selectStudents)
		$.unSelectRow(selectStudents, rt[0], rt[1])
		if (selectStudents)
			$("#studentsubjects-students").val(JSON.stringify(selectStudents));
		$("#mod").removeAttr('disabled');
	})
	let subject = [];
	$(document).on("click", "[data-subject_picker]", function (e) {
		let t = e.target;
		if (class_allocation.length > 0) {
			let rt = $.RowSelection(t, subject);
			$.unSelectRow(subject, rt[0], rt[1]);
			if (subject)
				$("#coresubject-subject_name").val(JSON.stringify(subject));
		} else {
			alert("Atleast on class should selected")
		}
	})

	let subject_papers = [];
	$(document).on("click", "#subject_papers", function (e) {
		let t = e.target;
		let rt = $.RowSelection(t, subject_papers)
		$.unSelectRow(subject_papers, rt[0], rt[1])
		if (subject_papers) { }
	});

	$(document).on("click", "[data-papper_assign]", function (e) {
		e.preventDefault();
		let action = $(this).attr('data-action');
		if (subject_papers.length > 0)
			$.post(`${action}`, { ids: JSON.stringify(subject_papers) }, function (data) {
				$("#tdata").html(data);
			});
		else {
			alert("No Paper has been selected");
		}
	});

	// end of accounting module script
	$(document).on("submit", ".jqSubmit", function (e) {
		e.preventDefault();
		$fm = new FormData(this);
		$.ajax({
			type: "post",
			url: "http://localhost/schoolpay/reportcards/default/upload-marks",
			data: $fm,
			dataType: "json",
			success: function (response) {
			},
		});
	});
});





$(document).on("change", "#reporttemplatedefinition-mti", function (e) {
	$(e.target).closest('formprocess').trigger('submit');
})
$(document).on("click", ".temp_term_class_assoc", function (e) {
	let tg = $(this).attr('data-target');
	let i = $(this).attr('data-id');
	if (tg) {
		$("#reporttemplateclasstermassociation-template_id").val(i);
		$("#reporttemplatesetassignment-template_id").val(i);
		$(tg).modal('show');
	}
});
// accounts

let summary = [];
$(document).on("keyup", ".amountin", function (e) {
	let amount = $(this).val();
	let item = sessionStorage.getItem("item") ? sessionStorage.getItem("item") : null;
	let detail = $("#CrDetail").val();
	if (e.keyCode == 13) {
		summary.push({
			"ledgerAccount": 3002,
			"detail": detail,
			"amount": amount
		});
		sessionStorage.setItem("sum", []);
		sessionStorage.setItem("sum", JSON.stringify(summary));
		rendersummary();
	}
});

function rendersummary() {
	let data = JSON.parse(sessionStorage.getItem("sum"));
	let tds = ``;
	let total = 0;
	for (let c of data) {
		total += parseInt(c.amount);
		tds += `
			<tr>
			<td>${c.ledgerAccount}</td>
			<td>${c.detail}</td>
			<td class="rightAlign">${c.amount}</td>
			</tr>
			`;
	}
	tds += `<tr>
		<td></td>
		<td></td>
		<td class="rightAlign">${total}</td>
		</tr>`;
	$("#summaryData").html(tds);
}
// Student allocation Scripts
$(document).on("change", "#coreexam-class_id", function () {
	let cl = $(this).val();
	if (cl)
		sessionStorage.setItem('ClassSelected', cl);
})

$(document).on("change", "#coreexam-term_id", function () {
	let term = $(this).val();
	let classId = sessionStorage.getItem('ClassSelected')
	if (classId) {
		$.post(`sets?term_id=${term}&classid=${classId}`, function (sets) {
			$("select#set").html(sets);
		})
	}
})

$(document).on("click", ".cancel_out", function (e) {
	e.preventDefault();
	let id = $(this).attr("data-id").split(",");
	$.post(`de-allocate?id=${id[0]}&class=${id[1]}`, function (table) {
		$("#students_data").html(table);
	})
})

$(document).on("change", "#coreexam-class_id", function () {
	let cl = $(this).val();
	if (cl)
		sessionStorage.setItem('ClassSelected', cl);
})

$(document).on("change", "#coreexam-term_id", function () {
	let term = $(this).val();
	let classId = sessionStorage.getItem('ClassSelected')
	if (classId) {
		$.post(`sets?term_id=${term}&classId=${classId}`, function (sets) {
			$("select#set").html(sets);
		})
	}
})

$(document).on("click", "[button-save]", function (e) {
	if ($.validate(e) <= 0)
		$(e).closest("form").trigger("submit");
})


$(document).on("keyup", "[search-table]", function (e) {
	let table = $(this).attr('search-table');
	dt_search($(this).val(), table);
});

function dt_search(value, table) {
	$(`${table} tbody tr`).each(function () {
		let exists = false;
		let $this = $(this);
		$this.each(function () {
			let $ths = $(this);
			if ($ths.text().toLowerCase().indexOf(value.toLowerCase()) >= 0) {
				exists = true
			}
		})
		if (exists)
			$this.show().removeClass('no_export')
		else
			$this.hide().addClass('no_export');
	})
}



// $(document).on("click","[data-delete]",function(e){
// 	e.preventDefault();
//     let id = $(this).attr('data-id');
//     let table = $(this).attr('data-table');
// 	let action= $(this).attr('data-action');
//     $.post(`${action}.php`,{table:table,id:id},function(data){
// 		if(data.success){
// 			window.location.reload();
// 		}else{
// 			alert("Something Went wrong");
// 		}
//     },'json');
// })