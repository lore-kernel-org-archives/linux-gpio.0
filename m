Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688473;
	b=MxYfybLTndnCYkUUtmIDqbY8y0pnPMO+MfOjIoVygu+H9Jg9cIHr2J0bVMjGRpVM6hOI
	 DV/ZYPl/CvOmtQl8zH9PVnzpa4v0KryABYucNgWlKE/g119HiAHrpt6g2WWFhiF4ze88q
	 BXOU7Dep4vQSqjz7ND68ur+DsIek12Mv1omOqYPPV5mtL4hnu4fFJJXwdf2Ilr4qGqt8x
	 44N0PvQvUMhh8/xJZ2XFG45INHxUKTDiIy7fEM1G5AjN3qCKH5e+Pam7CqbYJknbbIW5g
	 eRE8E0qXyiWWs54yhBmRnY+IXy5nEiE8r+oaeq86+kh1Ra27aGoHmcH75gutCnAMfow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qoiBeOqQVNoU8aJNXpKrMyC1p4sNgoHSiwfsQhboqoE=;
	b=iRkZwX3XNA52XRCEZJz+aI6QVIZJNuqLJDU5hw+z3juzsl96XrGHQrik7njIe3YX02y2
	 7qggIvPBcIuTpEFZuJglhaejnKPhAH8x8QOxh5wE+eZZ+mqS+IHLIQIjToj5WOE9f/pOI
	 Qz48izyXA7DYRuKaR301y2opH2s2eaGrMGfdFjzntnoF+HQvs42WBd+1qNiYH2jkpHfCr
	 UmIGsjrBZnGM2NEmJbuGtleiyDwPaTyds7jy4I2R/bTFnyR2Usv4lbU+G6Zbag/tkzp2l
	 7dPE/dCxgZooefp2V0CkuPLfiQCgmdzXe32yOfiyzswWSxO4QLZiODfxQ645YtK1iRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HZ7WAs7M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WtzCquEY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FABA606A321
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FABA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HZ7WAs7M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WtzCquEY
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AwRD2594882
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qoiBeOqQVNoU8aJNXpKrMy
	C1p4sNgoHSiwfsQhboqoE=; b=HZ7WAs7M1TXGILydjNUxEdyCoz+UYO0QXn0BiI
	fKZsYTY9DHGT/o1mGTg3OcwrJum/PcmwnNcjn4xEqJqXn5lvuI9fBbNp1fQTtXJ7
	QOAsvTe67NUcfcLoMJr4lkdTWL1XyI4vY7H64BgIjqO98x4Dg/FWY9H0dIcu9ssb
	5fvIZroCVIUbxzVd6Oc6dwk8JkrcHMLu4AIb3yYce1g4PsaAfpA1rEHz1ddBUdON
	TGa8ozY0hb8YU7paEhXI6fg/jxLDWxNSSMqKbh8nFC5e1BIdBbUHxfICJnmTsPj7
	U3NFInDFcqU2yyn3j0NB0cR0sctGqbtZ66fipmH0ehrKlX3Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sap9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-948d83322f6so524935985a.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 02:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688471; x=1796293271; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qoiBeOqQVNoU8aJNXpKrMyC1p4sNgoHSiwfsQhboqoE=;
        b=WtzCquEYErL8M35v8c0rwT0DaVQFadHTpD/tiVtST6zdv7FQ1q2EU2DWHS18z039sJ
         rpdXOp9y26fLwdUUOk3+c8kMd5wHgOKGR4rF3xUdUlJdia+AUIu2QUmvZoBknoqdHVd0
         fn0qcEIF8iSB5CG45UAjOVd/jPM/4XT4tHBf3TyGRzNe0GJVYv9x/fsLyfYbVYVtsjAl
         ZKVpC43WJWi6wmW3Fz7W26nF+nrC9rpLyA0VS7VUb7dE6hZS+0m2GfcHgEJo/nfzGOkY
         jGY2zjG5+cxCG/94HRuWrpH8ckuuckvybZox4fe12k2qmrPNI93J7P0oHqPZLOLDWuMO
         gxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688471; x=1796293271;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qoiBeOqQVNoU8aJNXpKrMyC1p4sNgoHSiwfsQhboqoE=;
        b=nrLJgcBotCN5P1XIUo2TV+OxhjXzivUbdBmkfohoxgwm7LznSQp1skprAuiWFSatkE
         UZvaRXYM5Sx5dydTA0z7k5gu3JtOWzYa9fPGu9W5iwTImC949Uo1nSiV2pJUqz3f8lCR
         jN60RnysnpWSTqoiCDxx9uOgen0NUJbyKabFmqdUnCw3S/YU9UDx2nqveA7dNVJcmwbQ
         oIvRVwscQO81Y6sfxdvSs5LL/19pIZ+OrEUC66OybHdo6KfFCEeMeX6k11WifCWI8eQA
         MMe8BsCXsH1F5VQ84YrDrk0t0uDtiffaoUqYTc8xnDGvKFnBdBKoPEDEd/HanVdJVsV8
         9Fkw==
X-Forwarded-Encrypted: i=1; AL+hErGHOCvMvjqpjUpwgJhB+n6iSwju1niY6KDsC3FTyRr6rX9UXw9+0To38fGC84LkO42DTpav7+QfgKhy@vger.kernel.org
X-Gm-Message-State: APuU4Z/YcTxJ3CNAyOFxI+0LADwm8xhk9Pn/76IouI1p62wHyTBoLzSO
	bsE+t/opm5tXXP5vUen4CxmQ8XYH6SbMx622ptfpfYM6Vsk50LYGauLHPk1gxmH/l7o1IWH3JYp
	F7Bx56CypWJjcHQNtXB77OZCKy3AFFwArObQdskNv9Uoa+monyXhEkyVT/XgpLH1S
X-Gm-Gg: AZFdTZdemrNkR0LwQrmj3UBZSepzrmEu/uHImIqtVoyuc6lg4wnYaEmHBlPn4tOHaU0
	7+YcCu7q1bx6enKv5hDRyKiL+7gD6Lq+NOEEhhoJH5pNGRR+a0xtPbg/GnHQd2sXpgfJ1z3q0Pe
	ZJlkDFKZyNgtnAbURf8t/yEj/qsJcPkvQsVntEBVqMmtdPetROmgJ3CwMxxPlGMEza55EryBzmV
	XhHNzgFfe3wfYTHit8B7qresGAiuXd8PzJaUaZA207Y5PCPcRSmvV23P2q2pXaLeoQTDaJ9rlRv
	yawgSUktE5xj5nyWM//DA0NpWN0JybCoyQCBvfySdxlibMytsrzt31mwQ6h9VUVfEKubzmw+kKM
	Mszzz5oLZt5YcDPSi/WO6p7NQDmmb/XN7DUA3DHHKBWG2ooRBB1s3Rt/lpWbVQ83BXD0QuysY8q
	i1Fj9Dgsn0HZt0yLBgzjNvlKQLqzI0sVATpfosNgjtDZnZ8gYXl0Kp4wgV5nLc03o=
X-Received: by 2002:a05:620a:6846:b0:93e:c12c:9b71 with SMTP id af79cd13be357-949bab6416bmr3328273985a.76.1795688471072;
        Thu, 26 Nov 2026 02:21:11 -0800 (PST)
X-Received: by 2002:a05:620a:6846:b0:93e:c12c:9b71 with SMTP id af79cd13be357-949bab6416bmr3328270185a.76.1795688470579;
        Thu, 26 Nov 2026 02:21:10 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 00/11] pinctrl: qcom: fix and extend egpio support
Date: Thu, 26 Nov 2026 11:21:04 +0100
Message-Id: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABAICGsC/32NTQqDMBCFryKz7ogZfypdeY/iQuOoA2piYqVFv
 HtTD9DNg+/xfg7w7IQ9PKIDHO/ixSwB6BaBHptlYJQuMFBChVKU4arNjFYWvbkJebBikNKO7k3
 Zpm3OEIrWcS/va/RZBx7Fb8Z9ro9d/dy/c7vCBNOsJ50ULRV5WRnv4/XVTCE7x0GgPs/zCzLb8
 K67AAAA
X-Change-ID: 20261124-qcom-pinctrl-egpio-23d27a8b3b5e
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2532;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=66+aAGMG6/fPdYIs/CBXWhOipwgEcqKXSc0p9m5j+OU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgSmeILe5jThkGkiayC/U3Ob2PzyB32W/tFW
 IlIzzBYP+eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEgAKCRAFnS7L/zaE
 w7iYEACay2URxqz5dSxqO8cnecu+sigR9ynr84ZP5R/u0YGirhVkyIdZKz8Syoq0mcJpsR+Qbft
 G4cOppANAwQnu3nRavMDdXptY2EK5wcHt7BEvPA6jB707bBMhBENQeqs4gOGH8bXnjga0j9rjkI
 AB8ZgYU4LyrG9Az510LTazZlRVool1mqNinudFLQRbT3oVBGuMbel8C2XYsZJO5Yx2AmqcxHLfz
 POJCmABeTfQRAqVzegXosKIflWNm6itI2XzWho9uDMAZ0ip809YZVKD9+dTiBtOoGkM9MVpSEsP
 lbQgWUlTKL4btlP/E9kFZwDG0QCIDlLAZb8cjAnswzQJz5uo93c7P7JVw5JxEHLWqFPaAHIB829
 QCN/2PyTY3ez7UxZKZpJYZAfuItMIQZKLqSXqPrtBjV4bZJSH/HPCMX5ShLM8baUt7hbk6Piqzr
 1k14Mz3CgcAoSE/EeAZw4tyVfQvLSUPOMmqPMZcVNb3KbMnPGJntmraDGYDMyU3AM4m0+sofUkT
 HZZ6zLhY2hDSypotGMwuFiFpJcoRnJKjVFkjnPVShQF7z2L+F46WoY5riuLE8jJM4Hv+KIV/unJ
 z58LYFKvqsTwdt7FSKAKJgykBUzbiTUpmIzQCLJcPqtS5AUDgUu/A6ypMUGwu0tyahgS4Qs49ju
 epNs3lzb9AFgJMQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b080818 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=Q4R59cM0UI1Gu6HzFF0A:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: mW8nIfxjdVl9J5zeKupmaxqIMaIgUvJW
X-Proofpoint-ORIG-GUID: mW8nIfxjdVl9J5zeKupmaxqIMaIgUvJW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX/smcWJm9C0nb
 KbRf9IbbZOiU+M+tBCRV7HHsVg/aCMS0MCg8wXdsR+KKHNOJKs9BqMdttHp5dBVjnXx+ENmekwh
 K87hRHeStKfz1C7Axu9yfmNygcowbv6R2NB9PlbLZ9JRScL/PpwEIJtkvlySzgX87T6hrJWAAnH
 tDdDcggv63zLTPUYaoNf7pcvL25HoYTNbB6uDNgH1qKlM2uKy/sOnTVChr4ArpWMzsEl69ziK0E
 SDE12htwEDBGwyp3OjaMQhcPZfRyDhrkiX9poCrEQQFvtQ/7PP+ljIpCjMPcWoVkVCbMEYZxoEy
 bJrhg+3VXOd0lMlmWxngNA582LKUDjMvSXbDy2Bw46AIw80Td404eQYr3kPTj1WrOsULhbwLLvD
 QRZy1UPtk2f9cAasXLEn2UkzBub60IsdL2WO+UOwj7ZRokI/cJojf0m+KQ3folCcCJsxExWtQJd
 XnRZbcQGTYosdZd9YNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXx6lwLOfo6Prp
 OpE2JeUNun4f3Ag8OQBLubQBWt5c603zWqccPmDGjargWXtME29/GU/OrzIY5cXRAV3E86eQFmB
 NIGoeXRBY/QWblybb1yglmsz4vFyuAM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

Several Qualcomm TLMM drivers still register egpio as a strict function.
On those SoCs, a pin muxed to egpio can't be requested as a GPIO. This
series converts them to using MSM_GPIO_PIN_FUNCTION().

While at it: document egpio in the sm8250 and sm6115 bindings, and add
the missing egpio function to sm8550 together with its binding.

Patches 1-7 are fixes and should be backported. The rest is targeting
v7.5.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Reword the commit messges for DT binding changes to say that it's the
  TLMM controller (as in: hardware component) that provides the egpio
  function, not the logical pinctrl driver
- Pick up R-b tags from Konrad
- Link to v1: https://patch.msgid.link/20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com

---
Bartosz Golaszewski (11):
      pinctrl: qcom: sm8250: mark egpio as a GPIO pin function
      pinctrl: qcom: sm6115: mark egpio as a GPIO pin function
      pinctrl: qcom: milos: mark egpio as a GPIO pin function
      pinctrl: qcom: eliza: mark egpio as a GPIO pin function
      pinctrl: qcom: hawi: mark egpio as a GPIO pin function
      pinctrl: qcom: kaanapali: mark egpio as a GPIO pin function
      pinctrl: qcom: maili: mark egpio as a GPIO pin function
      dt-bindings: pinctrl: qcom,sm8250: add the egpio function
      dt-bindings: pinctrl: qcom,sm6115-tlmm: add the egpio function
      dt-bindings: pinctrl: qcom,sm8550-tlmm: add the egpio function
      pinctrl: qcom: sm8550: add the egpio function

 .../bindings/pinctrl/qcom,sm6115-tlmm.yaml         |   4 +-
 .../bindings/pinctrl/qcom,sm8250-pinctrl.yaml      |   4 +-
 .../bindings/pinctrl/qcom,sm8550-tlmm.yaml         |   2 +-
 drivers/pinctrl/qcom/pinctrl-eliza.c               |   2 +-
 drivers/pinctrl/qcom/pinctrl-hawi.c                |   2 +-
 drivers/pinctrl/qcom/pinctrl-kaanapali.c           |   2 +-
 drivers/pinctrl/qcom/pinctrl-maili.c               |   2 +-
 drivers/pinctrl/qcom/pinctrl-milos.c               |   2 +-
 drivers/pinctrl/qcom/pinctrl-sm6115.c              |   2 +-
 drivers/pinctrl/qcom/pinctrl-sm8250.c              |   2 +-
 drivers/pinctrl/qcom/pinctrl-sm8550.c              | 105 ++++++++++++---------
 11 files changed, 71 insertions(+), 58 deletions(-)
---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20261124-qcom-pinctrl-egpio-23d27a8b3b5e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

