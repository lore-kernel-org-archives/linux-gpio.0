Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4B0442118
	for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2026 08:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771142; cv=none; b=CGhewwh/gu4TqH6HVTX3zVmNwLPX3UqDZxJ3okJHddqbksHspkJ6nghkZWfx4tjVsZGP0t2tXhSqnj3D38IPhdHrQUs5ZoxNx1o2Q9HosaXeq1UyzN3mtF8JlThXp9DIXlzjyPAnZvx3aLDPHOAFIGDz3MCLJfIxS2ltW/7SD3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771142; c=relaxed/simple;
	bh=3q6Z39zXu+sXz4L20YENV+ryY3+KVhZBD8nZWaT2u4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WZ26cZPsYlkzrAX3Wz8OZFenUTnddE+YA3Bt9NCPmOVUzg240i+FFVcIqzbV4uoaDlokmYzZN3HCjnT5datYrGEKqcQLdIpXyZb2fZkxaCuSw+9PWZzuNgy6u0RBpsZ3NC3pCpbx9domlQ5AKMroXny3jko+NOugcQcx38CDPe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jB3TrXkE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UBEgnkic; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jB3TrXkE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UBEgnkic"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777Mt43363522
	for <linux-gpio@vger.kernel.org>; Mon, 7 Sep 2026 08:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	45cffnb6U5RjyHE1JFoKDcGtCi7FlACzCtxDXUL0umU=; b=jB3TrXkE1zwUtZjg
	B2r8P8Xx5ngw3qziVapRbL2rKVCMvTdes+HAJ3MGDZcaMHufVkAdvjVkB42vkW4o
	3r6eKQAS4wX9+KmbeRHIMlAscWH49dB+FOUMXLl2oHunWXNA2LuUHoywKreIn2/K
	HqMnWpwmH3nDlHcfXWQ8w+gcXnuhP1RtR8M7eXqZzNMoad52sFE18AkvKMfR9oq3
	nW5P5f2cnNF3CQy/Am4ORP3Cfvnlm0geT0gdB0JOGefj9neMZh64ARPZP7cxjr2J
	K/c+oqeTELW+bQPhwkBfpXhiKiVY2/nUzC4fFWrIlUjn+XG6TB6+qaWEdHrmEuSz
	ncqxvg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj14ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 08:52:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso443783885a.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 01:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788771127; x=1789375927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=45cffnb6U5RjyHE1JFoKDcGtCi7FlACzCtxDXUL0umU=;
        b=UBEgnkicoYYjdkta3FrgLNxvklmcus4rNA++qke/zEoq48dE0aD6gmL1anUW2kQklj
         /zkmdILEKGj4rP4cozHyro4IGUubyHrhSR7hgSG85BQUmFOQOPUQSjC7CMC7qz/bzEfD
         5AKdaH92Iu9LfSdpw3Wp/6FxMosVoTi5KbGaDIta6Kn/GFMvnmn9yLZ21eVT0K4CyZWV
         udIjT31s0cHPbK4WdXhaE+efb7Tx3No8GNy579R2VWBJ9yelZzfY9feqiNmUZLMf3X+d
         XkekIFxVgw754QshbqXedkr8IQRR05M6zjWVCiY6yHJg6TvPF4dRKgsu3M1Z3912wMZ6
         dIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771127; x=1789375927;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45cffnb6U5RjyHE1JFoKDcGtCi7FlACzCtxDXUL0umU=;
        b=C8S7mbPqfeJpuI/z/5eimHVFeIUVyF1BEGsgwpU6/KYIrqSqbqCyt1XMSgxEFt7bDz
         SJKla3NiqlWuAiewo6LRBro99i8MdmESmPynwwgpUfK5RsaW8IglSjyTyVJ0msU3DE8M
         3lPx49gufs36Qdk9e0cNMY+3lnN+x+Cvrfr+QPJ93dzStNRz6SQDBezu32Hjqu71TVM4
         LwiMbluG2LfHhpXhIqc8F3PbmI64jx2wbmlIRQxTbR/MbOvitIJkGYHYjmbYJdf0Yw/I
         i/CO5M8eJHuqXehZjN9iSITbLWnIeskgQYa5zr1gyNKjVhkOV6l5zqe3WJ/ANaTvwIQM
         bWXg==
X-Forwarded-Encrypted: i=1; AKwUvBz8rmrZuacTx77kqJqWvSaCR9Kqd5OqzNKLwbFR8rk84wf2keAEz/GQ3q2haOtPLiV+ngXtLD+7rNLe@vger.kernel.org
X-Gm-Message-State: AFuF++lStZagf4QtDnLPbP73QlzDUyyWXYcJy31Ls7t0uVGsZcA9aiOp
	lf0GA/xdg+8fVN8W9mZ1ChZlhnoHj3O7Tvta+hsSP2FXeoep+yi511nK5aAMEfoOx424UvcQYRC
	yAyJnEnOziVUuCDPaMypmVqrb+bq2JdikExTWEVz3Z8Rpk1VrH2CTQKAUxSyKbfK+
X-Gm-Gg: AYBFou1e1CBLhkUTPUfmei4wslpmvLzzlLQ1p7PU6z0NosuWxB/rRdeBOTZxW6zNZvP
	IG2+K3LQ4vVHWE43n6brNMdJeCseOIflLdMLvcrWEIumWBdUx12mO2V6JaNJP83rZfSOTG20kJC
	im6rad6k6A3A0lTjI/UpVEctECfL8+bncGIhGiQIBvZaZaePJ2e38AqSzJqR13eBabLTec4zGYG
	LocE05w+37b60vsD2o/p+f43JfR5+KI3kKZA5aR7wPtxeg35hoqG+l+72Ybg5AoIsjm3jPEYVL8
	Q1rQf19WHk6LDd9lETeWGxgO+Wu0iNcShhDMLXLjU7Z7E/7S4RadbLEbhhjxC9xvXbrNpRpc6dd
	EXhUHLvvBxoxquMHA2cqnhx/OkA==
X-Received: by 2002:a05:620a:2894:b0:937:11c9:37f1 with SMTP id af79cd13be357-939803455a3mr2211877785a.16.1788771126818;
        Mon, 07 Sep 2026 01:52:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2894:b0:937:11c9:37f1 with SMTP id af79cd13be357-939803455a3mr2211874385a.16.1788771126413;
        Mon, 07 Sep 2026 01:52:06 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:48dd:b57:9236:95f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm207319055e9.4.2026.09.07.01.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:52:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, "hpp.iscas" <hppiscas@163.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] pinctrl: qcom: ipq5210: Publish the OF module alias
Date: Mon,  7 Sep 2026 10:52:03 +0200
Message-ID: <178877112161.9799.4801508873821815896.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905134340.67477-1-hppiscas@163.com>
References: <20260905134340.67477-1-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX1qFCgPI3WhOX
 CHRhFOFVW27yMqU0TSMDwfIIhNfvauIDHkwNm4/ohqyjo/c462NNSP4m4wGdMgvdaJnqKGu/xmg
 vJ5jEc5IT/tR5zyAId7/oAGEN/oktDz+/pW6qK+UOO76zDcy99zZFvU0y0vKJfIYQTRKnIEX7sb
 LKijsFdg+UVIjjd0AmEWTxM4/PoQW1MYk+H83oeFmEatYCkG+cJsmH1TZD7p5tJK9xX6JNFcWRk
 5v3wKScMHxIld5e2tiO3cBjX9eccoRufbXngKt0G8uadeb37MCwlZfkTr0o/XWnowz8/AmZtM2J
 i3Ky2ynYzqBa0N1NF2OHKafiOjCn7RYA5Wirx+A5W6eql9Y1HXJoDRySygarCPyHFGs5/FeQpt2
 LPtv2GcjADenH2pVLwijtHdrVuO5udKPZyP6InodcdpMvkxuj9slD5zTdNPauPt3wPuTrqmzARP
 39OYO2GeJB7mslUJB0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX9fpJJN+vUfg8
 BmQbUhVvZHKQHXGhqZbfhbyQ9kusKpfBMiy8p4QTO1ds340+eSbFhM6fchPd03c+nNlfMbTlgY/
 WCBOu/OGQ/0zA7U9U45+eD7F3w1RiF4=
X-Proofpoint-ORIG-GUID: 85mcuJm9b8Ne0vdkKBEuy5dObX1sMEqP
X-Proofpoint-GUID: 85mcuJm9b8Ne0vdkKBEuy5dObX1sMEqP
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e7b3c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UYzP0Bt1LNVb4JyMi9kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070096


On Sat, 05 Sep 2026 21:43:40 +0800, hpp.iscas wrote:
> The IPQ5210 TLMM platform driver can be a module and matches through
> ipq5210_tlmm_of_match. This table is not published for OF modalias
> matching.
> 
> Publish the existing table, preserving arch_initcall ordering and
> the shared MSM pinctrl probe.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: ipq5210: Publish the OF module alias
      https://git.kernel.org/brgl/c/818103dc7f5998a0d7957fb71d4deecdf4d579e1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
