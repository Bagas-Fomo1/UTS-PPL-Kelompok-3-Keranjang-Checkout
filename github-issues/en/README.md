# 🌐 English Defect & Artifact Register (GitHub Issues Directory)

**Course**: Software Quality Assurance Practical (Praktikum Pengujian Perangkat Lunak)  
**Group**: Group 3 - Focus Area: Cart & Checkout (+ Login & Home)  
**Role Responsible**: **R5 (Defect Management Engineer)** - Bagas Agung Krisnawan  
**Artifact Purpose**: English Version Documentation & Defect Quality Review (Tugas T8 / Bab VI UTS)  
**Generated Date**: October 22, 2026  

---

## 📋 Overview & Quality Control Summary

As mandated by the Midterm Exam specifications (**Tugas T8 & R5 Responsibilities**), the Defect Management Engineer (R5) is strictly responsible for:
1. **Quality Inspection & Validity Gate**: Ensuring that every defect report satisfies the 4 validity requirements (reproducible, benchmarked to oracle, non-duplicate, and backed by full-screen evidence).
2. **Defect Severity & Priority Standardization**: Maintaining objective sizing and consistency against the *Severity & Priority Matrix* and Sprint 5 Quality Gate rules.
3. **English Version Translation**: Maintaining full-fidelity English equivalents for all GitHub issues submitted across all team roles (R1 through R5).
4. **Triage Minutes Recording**: Documenting 2 to 3 concise, formal sentences reflecting triage decisions, adjustments, and remediation commitments for each item.
5. **Traceability to Kiwi TCMS**: Cross-referencing each defect against formal `FAILED` test execution IDs in Kiwi TCMS Test Run 15.

---

## 🗂️ Master Register of 13 GitHub Issues

| Issue # | Defect / Artifact ID | English Title | Role | Category / Type | Severity | Priority | Kiwi Traceability | English Document Link |
| :---: | :---: | :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **#8** | `BUG-001` | Cart line total shows $00.00 for every quantity while grand total is correct | R2 | Bug (Financial Calculation) | Major | P2 | TE #87, #89, #90, #91 | [issue-8-bug-001.md](file:///d:/UTS%20BAWUK/github-issues/en/issue-8-bug-001.md) |
| **#9** | `BUG-002` | Cart quantity is capped at 10 units while the reference build allows 99 | R2 | Bug (Functional Bug) | Major | P2 | TE #88 (TC-81) | [issue-9-bug-002.md](file:///d:/UTS%20BAWUK/github-issues/en/issue-9-bug-002.md) |
| **#10** | `BUG-003` | Cart accepts quantity 0 and keeps a $0.00 order line without any validation | R2 | Bug (Data Validation) | Major | P2 | TE #86 (TC-79) | [issue-10-bug-003.md](file:///d:/UTS%20BAWUK/github-issues/en/issue-10-bug-003.md) |
| **#11** | `BUG-004` | Missing accessible form labels on shipping address fields and disabled focus outline indicator on checkout form | R4 | Accessibility Defect | Critical | P1 | TE #114 (TC-107) | [issue-11-bug-004.md](file:///d:/UTS%20BAWUK/github-issues/en/issue-11-bug-004.md) |
| **#12** | `BUG-005` | Low color contrast ratio on product description text and missing alternative text on main product image | R4 | Accessibility Defect | Major | P2 | TE #113 (TC-106) | [issue-12-bug-005.md](file:///d:/UTS%20BAWUK/github-issues/en/issue-12-bug-005.md) |
| **#13** | `CHR-001` | [R3-CH-01] Exploratory Testing - Add to Cart and Cart Management | R3 | SBTM Test Charter | - | P2 | TC-77 | [issue-13-r3-ch-01.md](file:///d:/UTS%20BAWUK/github-issues/en/issue-13-r3-ch-01.md) |
| **#14** | `CHR-002` | [R3-CH-02] Exploratory Testing - Checkout Flow and Order Validation | R3 | SBTM Test Charter | - | P2 | TC-78 | [issue-14-r3-ch-02.md](file:///d:/UTS%20BAWUK/github-issues/en/issue-14-r3-ch-02.md) |
| **#15** | `BUG-008` | Checkout postcode field accepts 300 characters without length restriction | R5 | Bug (Data Validation) | Minor | P3 | TE #99 (TC-92) | [issue-15-bug-008.md](file:///d:/UTS%20BAWUK/github-issues/en/issue-15-bug-008.md) |
| **#16** | `BUG-009` | Cart allows negative quantity (-1) input without client-side prevention | R5 | Bug (Data Validation) | Major | P2 | TE #103 (TC-96) | [issue-16-bug-009.md](file:///d:/UTS%20BAWUK/github-issues/en/issue-16-bug-009.md) |
| **#17** | `BUG-006` | Cart item delete button ('X') is unclickable (dead click) preventing item removal | R1 | Bug (Functional Bug) | Critical | P1 | TE #108 (TC-101) | [issue-17-bug-006.md](file:///d:/UTS%20BAWUK/github-issues/en/issue-17-bug-006.md) |
| **#18** | `SN-001` | [R3-SN-01] Session Notes - Shopping Cart Exploration | R3 | SBTM Session Notes | - | - | TE #84 | [issue-18-r3-sn-01.md](file:///d:/UTS%20BAWUK/github-issues/en/issue-18-r3-sn-01.md) |
| **#19** | `BUG-007` | Cart item line total calculates to $00.00 upon quantity modification in checkout flow | R1 | Bug (Financial Calculation) | Critical | P1 | TE #107 (TC-100) | [issue-19-bug-007.md](file:///d:/UTS%20BAWUK/github-issues/en/issue-19-bug-007.md) |
| **#20** | `SN-002` | [R3-SN-02] Session Notes - Checkout Flow and Order Validation Exploration | R3 | SBTM Session Notes | - | - | TE #85 | [issue-20-r3-sn-02.md](file:///d:/UTS%20BAWUK/github-issues/en/issue-20-r3-sn-02.md) |

---

## 🏛️ Defect Distribution Summary

* **Total Formal Defect Reports**: 9 issues (`BUG-001` through `BUG-009`)
* **Total SBTM Exploration Artifacts**: 4 issues (2 Charters + 2 Session Notes)
* **Severity Breakdown (Bugs)**:
  - Critical: 3 (`BUG-004`, `BUG-006`, `BUG-007`)
  - Major: 5 (`BUG-001`, `BUG-002`, `BUG-003`, `BUG-005`, `BUG-009`)
  - Minor: 1 (`BUG-008`)
* **Priority Breakdown (Bugs)**:
  - P1 (Urgent / Quality Gate Blocker): 3 (`BUG-004`, `BUG-006`, `BUG-007`)
  - P2 (High): 5 (`BUG-001`, `BUG-002`, `BUG-003`, `BUG-005`, `BUG-009`)
  - P3 (Medium): 1 (`BUG-008`)

---

## 🔍 Verification Protocol Followed by R5
All 13 markdown files within [github-issues/en/](file:///d:/UTS%20BAWUK/github-issues/en) have been curated, reviewed for syntax completeness, and equipped with:
- Standardized metadata header with direct clickable links to the live GitHub issues.
- Professional English descriptions for all sections (Identity, Impact, Reproduction Steps, Actual vs Expected, Evidence, and Traceability).
- Concrete 2-to-3 sentence Defect Triage Meeting Minutes signed off for R5 and R1.
- Full compliance checks against the R5 Validity Quality Gate.
