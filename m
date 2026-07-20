Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F104308F38
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 09:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539140; cv=none; b=l4bmaWOI/60iT3R9qc4BEaWJqSzD8r/a87rPXCpXj4aaboKf8iRoqu1c1bcyMb+Mp5G15MUPksCY80XdvZjXtOBWFKGcMbLdKZDEdIw8TmsKZxRkbhGBpXkbbHKHsGloo4SARBdvtCx2E1TrePqMRDaAcPqs7NFhUR0DC/zX8/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539140; c=relaxed/simple;
	bh=sbod9CeyIRz7Ljpe4N6KGaocATinn+6GWhpqxloQqTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ugnb2E/mTIwbBeCuaYKbg1PpyqVqfCsctDdMAxesT23RtHs9764P0y4ZZI8Pedhc4tKlFvv/ut+XJ5JFPmywb+xI/asoaC2RR11z+IYsUJeHrZhMBtOGM17J3aO05Oungw/oZzhkwkrv31ybL/2Lq3uD7HrTMdVPskYkg8t0+EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0lxtiT4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/mkFI3+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0lxtiT4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/mkFI3+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K97cIT1653607
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 09:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKqmstyN0rC0H5RkaB9dqt/PSdvfLqjYYtzIaK7Bw2Y=; b=n0lxtiT4IdPQFfgm
	HVhT0PV5N/p//xkhtliyliWPBJvFg/m/GFj6+Dr9VgGHF8DcdAan2RDrXXhhadca
	RaBeKKZMWA8nMxoIr49talXZmp9eNkhYt7U05tuBXV/YJ6cIUVS62XjoLmdvGNsn
	1oVXlhcYlg4Siugksm3iK14y+5eS5mXQcAYcC3mp0ixFaAo1KqZo2fFUEwpppCEL
	15RSLFh4rkvBUvlzmLRi7wy1tgWeMjGE6S8XqV0cJZpnwWtP1LEyCJRD5rDkD5kf
	DWbH3iDIO3sSwezkwEhGSZcdlKIjL+H18am802Hqnbw5b5F+KOb2RHmv3feGhYeI
	9eIsRg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs501bp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 09:18:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84865f326efso10305377b3a.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 02:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784539137; x=1785143937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKqmstyN0rC0H5RkaB9dqt/PSdvfLqjYYtzIaK7Bw2Y=;
        b=O/mkFI3+gaubG6KYgAmz6feHlweANWMSH3RM0A1Q32uGNEAiyMOdai2xSfST+bgkpx
         HCexcSCysPt3oOnfWY2zX9Y+CSo87gMXRDIRwEqXM1peUZZ0GYyWKeLMwY9vhkJ+nvz+
         x3jEi+j+rPlijNGd2cfWMGhpiChqkqL5ULS3JA7ThRScXyOiA380NJEPCIianAKCkA8E
         PpnJGKStBVBCy+JESzOSa3iVDl9eb6O66YjokGiES+Lu1a9x4EOMRNxKiMO0cH21jc2i
         cb+/WJwYtiIx2dMSwuoZOLke1D+lF9YnYzv5v1+BXD+JWOklF7j3U0qbdu9aNQfRUCHs
         LL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539137; x=1785143937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKqmstyN0rC0H5RkaB9dqt/PSdvfLqjYYtzIaK7Bw2Y=;
        b=GRpykJ054uCC1iaVVLy+56mww/uWCsujoQ6hblpts1DM0Ov1A1gGnWoNERvYVkI3EC
         6OHl5h7avTZZXtKu6lzCIPkXoD5fTVR5MzmwdMeFn96pUtb74G1GyM1oVnetqL6khRNS
         mrai7atI0EenfFtMjtwvFic/zA8pDPTwqLP4ZXXwrZ9wVS9IM9WBtSZ8cs/tw2XNdFVH
         cbo/pUn7g0miV4dStqAv0pICeg8D3u3OgCABUWpMWjp8HOJg9nGOu+cyNbN0q+4p7+C5
         W0RNLW506N0ejU7OYuB3QBj93iCstMAuARsYzOP9AAoONSl/iDik+A9e8nW8Yd98cQrw
         3uig==
X-Forwarded-Encrypted: i=1; AHgh+RpcJ0qaSLISfu6JmwMlyhISxngNRZLLeCFUm5UTDAyfTtMBWJiS/V9ApfPZ3b64vsJok+rr8IiIK2ya@vger.kernel.org
X-Gm-Message-State: AOJu0YxNfJhmcocIuUJqe3H18i/j9YNX6tPqDjwbKRxYzvYNkMzNahlv
	PfaFqGkjpjKdwvl3NXMDiLCUBNvBVrZhKNCvw9ZrZAV2RQkQGO2o7/sNVo8s8YNbN4oC+KX0min
	BQW8Zyb8nInPsUj5qmpozrVWatqONJ48SdUmbOOCLzvVBgW2oG/yZ+WYq8xGrezyU
X-Gm-Gg: AfdE7ckrp3UKMNQxM/2QUzZSr7rrEdnEOIYfUooi0M3L3Bbopf8XANMxDLOClVtayrN
	ci2N2VzHMxqU7o9Zuo5eb8B4+bdg+KlIeMfChp4WRewE8v4z9ZDhxSyO955+skFU1YendMBeF/A
	M3CWOn5NoBbSH0eHoVMb8hn/E0adA81mpfviQJaaIrtxE7psyVlKJxjeuNpu5lkvyV9CnF2Zbdk
	j+We/xaee67DesFwg64RCnKLrKeM7UPhCcyLw1DgFMqgme/9S/VxFlKyoUv46GJtlg9TfPnk+gZ
	9TFLg0+68+OKBM5RD02d+/Eh526Arao3Nlwb+l3+GewQKNXBFeq40pcACmQpo+4veRh76H2lz/z
	j7hqbqTXFZCXtIQv2MFUjwSulrg++Z5lX2wODm7co4xyh
X-Received: by 2002:a05:6a00:32cd:b0:848:6895:b763 with SMTP id d2e1a72fcca58-84c29505e33mr12646792b3a.40.1784539136733;
        Mon, 20 Jul 2026 02:18:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:32cd:b0:848:6895:b763 with SMTP id d2e1a72fcca58-84c29505e33mr12646768b3a.40.1784539136272;
        Mon, 20 Jul 2026 02:18:56 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb517f94c31sm4349636a12.13.2026.07.20.02.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 02:18:55 -0700 (PDT)
Message-ID: <dc3cd714-dc03-4586-88dc-333a5ed6846e@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:48:51 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: ipq9650: fix audio_sec_mclk_in1/out1 group
 pins
To: Taceddin Sancak <ts.solidarity@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260718002146.698973-1-ts.solidarity@gmail.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260718002146.698973-1-ts.solidarity@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwMyBTYWx0ZWRfX9PJ6Dw8Ik897
 JSJRt9IiBJFWDygY34Wlm+j2XAHG2+HN7kcClutGCJx3SwUPymzRQPRXW1hUm44owQP3HQcNoXK
 KqbknGHFGoKTJK/Zgk5uOhrPl9iyEPM=
X-Proofpoint-GUID: TJI5fKDY_xJMbu0ysLGhIQMrStYdMc3v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwMyBTYWx0ZWRfXwX6Gq0WSGqgl
 XXHcuZYs/aIqOWV8bbxGmpa1ZmJY6HMz3OA01Pcve1nk17fdQOpbZnInkjtEp4QwAU7TOetYygQ
 xblFeuXsQUDo9dqXCXIgX81zvQzbMYTGEe8smY7Hj8EzbnmQIw+xBIPcGFe9xqeYwcaY9Cesptt
 WqagLpy4fjiH9m/EAGQTiy+5Oxpgv3t5J/Od3u7plheq5lUYw2ZgUOJJSN//SeH7IMRUt/SClD5
 +jyeurihlP0DKxdV94nUFPFcSVaVznso9jXvcvtPp/kDVeNL6YZf/co/UdnaBwVDP6ObdodCDYs
 J4kTd5cGzr10t7EWJ3fSCCpA5gvjhNYpQ0pl1lRXDPPI6+uBPL3jDjrmAXbxvnHM2nUNGKiDZPh
 tgkQzBqLixwm62iYwqn9t2cSyBarKzk1TLoQ0P6/+pIcGhX5DuxIA0KhD74aftCakGqWG6dpGh+
 317/T0tg/WrdHsp5DkQ==
X-Authority-Analysis: v=2.4 cv=CpiPtH4D c=1 sm=1 tr=0 ts=6a5de801 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=abRMFraXAkW8j9leBJwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: TJI5fKDY_xJMbu0ysLGhIQMrStYdMc3v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200103


On 7/18/2026 5:51 AM, Taceddin Sancak wrote:
> The audio_sec_mclk_in1 and audio_sec_mclk_out1 groups both list
> "gpio37", but in the pingroup table those functions are muxed on
> gpio39, while gpio37 provides the audio_sec_mclk_in0/out0 variants.
> This makes both functions unusable: selecting them on gpio39 is
> rejected by the pinmux core because the group is not listed for the
> function, and selecting them on gpio37 trips the WARN_ON() in
> msm_pinmux_set_mux() and fails with -EINVAL because that group
> cannot mux them.
>
> Point both groups at gpio39, matching the pingroup table. This also
> mirrors the primary audio MCLK pair, where the mclk0 and mclk1
> variants live on separate pins (gpio53 and gpio51 respectively).
>
> Fixes: 3c8e7ba0e399 ("pinctrl: qcom: Introduce IPQ9650 TLMM driver")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Taceddin Sancak <ts.solidarity@gmail.com>
> ---

Thanks for catching this!

Reviewed-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com>

