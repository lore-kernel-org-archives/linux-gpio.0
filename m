Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521384;
	b=sQNIxVWRnSO55kuoNDvC3xjdrjSoDU5xw+wh7v0wCP0OEFFtf2MrFdXSXkw/1HfUgOtC
	 J3anZNoqa+jalrTiRsw11c73vxwYp8n1ni8jTEjzCvWeI682+aV/2y4P2R7+/fYQFFegZ
	 BwCgreaf80wfqoJz0zmN+wPgfZQ3OtgwMLSk1FLTw5bxoZUE7oZ/r7CducEmu6l3o4UXp
	 e1XOnX5G8ZCg6PcvSWnkF1Ota/q3/JiHjggfojeieb9+7YT3bbZ9m5txmuNn98BOx0UIE
	 4EtTBWgQZ7kzNVqmHrEVn9n60AWqKrt39oQgEXXfjyaYQ+k+xtRkRRFCMEC6yLAb1Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521384;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qiJdwOJzBM6Kd1w598aMZRytqMeSnmHW/XmVJ2AjRfc=;
	b=F+lMb8WhMWA7Ks8xPWdQ8ZkaxpUQ/UjVDZPxGGYbWmeFnsfMUU/CMQ6R0XpunnKDEIjV
	 SLrsXpN3hs5Avq9BM7emCYobrXK1jXA/CAXbaM3M22D1boXNIShiJy5vK91UU5MOOtsrp
	 ZSO10wnPfWY8RTpwT078MXgrro6n/v2HrM/Pn9HWmmkLLMjya232V2jx7xu2oNl8H1G56
	 8lQfC/Psbu//J3AiMgqgIblV/ymVDGvApENpFdwdiQZiNapdkFUWp0s0Hqs/oYmGpNsBQ
	 xBKQeI0Cm2Hqsc/NtStQSSXEs079BJw1cLg4SxDM1nN3LsoYXG2bwGHwFtGGxc2cxOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Nxx//tJE";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHUiewJC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BE4606A321
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 11:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78BE4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nxx//tJE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHUiewJC
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuaTx1991557
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 11:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qiJdwOJzBM6Kd1w598aMZRyt
	qMeSnmHW/XmVJ2AjRfc=; b=Nxx//tJEuRhKaWvnXEsr7ScrUeXod/e92f006Vut
	R2NVMCBIkodXOR2yMuJEPkDFPq2TLnLhFqon+sCO+BQR6PwCPXSbZcWL0b1ANd1d
	J7EkB7at4972z4M8cdKaU6D0Ci5hxBgvVWKcIjEQR2Bt39P8xZUX08SvNdDn/ItF
	r1frv/UOGmmi/J0MNVn7xt/4/ccr3KWbpC+tlnDl8lZn3Y4CDNI13QAjiSXvr34B
	aMDLTcSOJ2OCx54rV/QWSWs3OionBPeT4ihyCddbXKzwNklyLjVUU1wulBePn0oG
	w9KRhA/TWy1Q86pRRZrlnL+rV4hi9rkkJsNrZf/8+7u47w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6su4dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 11:56:23 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso4637534c88.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 03:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795521383; x=1796126183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qiJdwOJzBM6Kd1w598aMZRytqMeSnmHW/XmVJ2AjRfc=;
        b=jHUiewJCLezAMwgz7kRicDKbISqfg1rtZzbj5O7WfMq5pgUtVyzgBIAQd7G4ZZtYe/
         HTdPxnzujwqjNsOr4gh5/SfnoGbKqe9cewmCjHvcVr0P3YNH1NUVDwIEbLwp+u+8TTSM
         Ch5Rhy+Ctr3UqiTRc60JbLozMrUkG47GdsChTBHKuuGj+WmArJK51cQQoznVxRRuX/eR
         +TQp5qRERlQSKxcUCG5VKRPMcDI7MIgtwz441wpiyJBQJ/BTCSTinLRFjyynLVZkaTqJ
         sdHbizXcAnfPaIPGSPVaj47iNPq58HBB5TesJov50OxZe30hbJDBAABLfYb0db7e3+ks
         GgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521383; x=1796126183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qiJdwOJzBM6Kd1w598aMZRytqMeSnmHW/XmVJ2AjRfc=;
        b=uAg7MDSWRjPoTqm70rSEvWoDQ/rUIJFRL+h2ix12WMMoh/SMwiBFDMlmJOuwp7JHlZ
         JM09xZIGKCylTmng1AIHGeOzE2R5w/dYAalfl6w+XWZsmYDseRXrFzEVdMFX2HSIoeXb
         el4HwwqNereeVgJZlUlutWZK7AdFnwM353tMnABsfiIsctiEXdIHfs0npFl29FZ1avN5
         UvU9/FbI8hE6g2xegQHf6L4FPvh6uU/AKKGwfSv+yoO/Btwh/B1rcRSmuuQ5jzycxly2
         HrFxzck4V1VLjfFAkmlgePQEupIdTMBJ+hssSdDwwp/OI9H6XHA/khSXzaFrAEi0Atzu
         /RHw==
X-Forwarded-Encrypted: i=1; AL+hErEr6oBADsL71mcuCaTGeva7mqYZpnLxWrQpLIYHUPJQTERlPDUMmtzm3cOyDQLeuLYL1j+4aq2/8XfW@vger.kernel.org
X-Gm-Message-State: APuU4Z/BSbHmRP/DBlQq86ibxsEpr6nD52gBrgPI3YCWXDYeQcuErbJQ
	trj9+BMicb/fXYww6XpTi71f2gvCYbOx61/WNIIy/N8dmPneUbquewDtQwUKADcdnUBRo+zxQCT
	7SRwSTeS8zrT1sA5EALhblHGr/NYOc+Fm8oUOkCH7mX96Tn8mfaSBFmRSv6t5vNBc
X-Gm-Gg: AZFdTZc5L0URPcp493FNEqGPzKUfvzQbs86Q7r1/fkLmxHXPqzw4vFefjfVLS3muvzn
	wBICfmb7XmYHSFmCMYD53XWSVWvoBnAvnWjtbNjQR6nOyHpWQWRp3104ho2mET9oXhnTSJ4E943
	drmk1u8JV+TD2D9RAldJcHDtInixTSYlKvwaZbLMHRcumCoJlF6USr23uMvyAPmMChnEUy3INod
	8H5H5NrVp3FPb2unsxGFpFppowW33ynIZqMEw2Uz0NqgEDJNIgiZ32B6Vr4pRY9C8gTKQbWJLD2
	Be/y5EXeA7lQdTLG48u+FBhY2MDAXQIXcWJDUGBbDUYkHzlqs0H4eFL1n7P8aSr+u7n9+qG5TfI
	sIEDmFv5qy8S+yDi8TVgbnj+igIMp5osEpWa/7+SbW/pibDMBnc7XGKsuY9pheqxIljsGZfQeu6
	ZT
X-Received: by 2002:a05:701b:4591:10b0:143:297c:276c with SMTP id a92af1059eb24-1b55691aac2mr12967271c88.33.1795521382748;
        Tue, 24 Nov 2026 03:56:22 -0800 (PST)
X-Received: by 2002:a05:701b:4591:10b0:143:297c:276c with SMTP id a92af1059eb24-1b55691aac2mr12967252c88.33.1795521382015;
        Tue, 24 Nov 2026 03:56:22 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm35145257c88.10.2026.11.24.03.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:56:21 -0800 (PST)
Date: Tue, 24 Nov 2026 17:26:14 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Yadu M G <yadu.mg@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: qcom: Add Seca TLMM support
Message-ID: <20261124115614.cqzo6ilr2shmzrxa@hu-mojha-hyd.qualcomm.com>
References: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
X-Proofpoint-GUID: xdmffuq6wfYPPQeCJwuXQ8Vl-jtmp4W6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NiBTYWx0ZWRfXyo+Jw4wGfI7W
 ylzlQewDEEYitXF6RqMcYDcZhrFCQeqIka6HbQoOqkIaxZwSKdD/xD4Peszk/TM+oCKOIadCiS1
 yggnytNNUVxyKIlmL/xXBa+AdWI9Y3I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NiBTYWx0ZWRfX7CrTaKSh3jYp
 unSjgisbrMGWYYEVl1/yPIIYG6oXE68jcGg9BGSuZfcoeO/aF0Us8wvkq5xqn/7NjUcnj8Vt+gF
 EXoGk5Dv5g4Oh03t4Tc3zM4ruPf1w0/ngA3pxXpJAQHS+Vz+5ZmJDNZv4wQPB31++0bqhJGwakY
 t77YjO0dY/lI622ekqbL+2kcHdpaxWgmmmHcFZAYDldmEWED+OkGhuixjsQLNuJSsK5z1JKJQme
 l5mYAOlyN0ddNBDmQTqnCSs9QHbjsmCUfGlWvmqx9Pp2wbRqz2kHN70ZSHG07r4vcwgYMR1z9db
 kfL19r9kV23zM660KuOlUBrhTCSBGOjiID9uB9JwgbMEWOiUU8+NZWU27nylp6Ef4xmUDs9aQRh
 QZxHLAcDuZPB6Cgzt5ZFjGhluqdp+5SeQPOHgDksAo/D7iFtjTuWve8j5nAm0rCCbL4ogHboAxJ
 Qzk1cjQyVXhY2YSU97g==
X-Proofpoint-ORIG-GUID: xdmffuq6wfYPPQeCJwuXQ8Vl-jtmp4W6
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b057b67 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6J28aJzw-_SWfeiIoy8A:9 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240046

On Tue, Nov 24, 2026 at 04:23:01PM +0530, Yadu M G wrote:
> Add the TLMM pin controller binding and driver for the Qualcomm Seca
> automotive SoC.

Where is the introduction of Seca ? what is  Seca..?

> 
> This series was prepared with help from an AI coding assistant
> (Claude). It assisted with review on the device tree, bindings and
> driver (formatting and alignment fixes), rewording commit messages,
> and running the validation steps (checkpatch, dt_binding_check,
> dtbs_check and W=1 builds). All changes were reviewed and tested on the
> Seca Ride board.
> 
> Yadu M G (2):
>   dt-bindings: pinctrl: qcom: Add Seca TLMM bindings
>   pinctrl: qcom: Add seca pinctrl driver
> 
>  .../bindings/pinctrl/qcom,seca-tlmm.yaml      |  135 ++
>  drivers/pinctrl/qcom/Kconfig.msm              |   11 +
>  drivers/pinctrl/qcom/Makefile                 |    1 +
>  drivers/pinctrl/qcom/pinctrl-seca.c           | 1705 +++++++++++++++++
>  4 files changed, 1852 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-seca.c
> 
> 
> base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
> -- 
> 2.43.0
> 

-- 
-Mukesh Ojha
