Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501007;
	b=kK2S1Y/tEya0p3SYdwzQtycau2CvtSM58keOtiId1ypVFENWX0/e2x3Tpp/5Yd7UtZsi
	 n/C/pdRP//ZrTo/1SDWeoSMjpjadruKM5/OkGAT/IKppLMmqiwHqU2WHh+AOQdf5tbgQu
	 ajV3tROyIDSRDTrgnse7w7Ap7XZvafZC4iRfI7vuImAOewrquKOpAzzbF+pxqexarrlhf
	 qL7ga119I77SNxMDtOx26L6lEr4UGj7HOS02TtnmnL4xAHrNCmc9bZU0JCTI0qbHGJTi8
	 GIGcmhe1wpWdiapdCrnFvYNzggPfBvEnTQPobs/AlFeYcxJ3oS6IX/byQzFYwcLyfHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FQyWXo7MbA+VXzM7rtfZ3B92+0RgCk2H2hIoqilD3YI=;
	b=0LlQhPWw06nvwb81+a4TiVSuIczo1/OX6nLZ8W6w9YN5DVDx+gmhiR3UyYWeaWuUHeLA
	 7wYsc+miqVK+iJYnb8lD+0WJdFGdAVnpIRo3MYybAW4FkYSa4ZJJnbrHDHLJJSiHgEMsE
	 /olMXWJbjad6+TplJ6P2mfaPjRfCzCVQ3SK2hcGcdaQKDA4Os7yERR3bww1umDIGAFFD/
	 SSWc130qbSUgJWFOU9WxbAgXC3jVXqhv9trYjn5x/RgkSfRdfFtpyP7bLlzOgusBnfbwx
	 0dc6klReg8a1yM5kAAaPEazfqn3sWO2kSDymoky7WVRh2U/HK0g7+QK4hmF37BkXIAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPtpCxoY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GvQ0sUl9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33945606A332
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 16:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33945606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPtpCxoY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GvQ0sUl9
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZkAQ3180987
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 16:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQyWXo7MbA+VXzM7rtfZ3B92+0RgCk2H2hIoqilD3YI=; b=XPtpCxoYGBLC8Er+
	uIHqcOaD0whPuQr2tzN0YMHBaFrykB8FXZmjTh21TIhCP3KU+GefJLHceHePiReY
	hfECzRZkocWDsHoIEBH1CXoLQwyxzOmDPDBtEQOULXKsOyBEL3HVzztgJ/xmyblW
	LSjcMBC1pUfk77yeQEY8/mhPUj+QCQlMxg28Q/d+o2dLJvs+EPBX85Pex3h+7rsk
	jFc07AuZfeBf8N+GWgD7n6vr1sfJoZmkeU8jFkYAoKO77XCu/Y5++YELifR6aURh
	G4PEBwADlZdW+ih9U7Vl1gHq/TcZYCMP7L+CFzUQj1r9RcnH57VFmgh6KxFEfP5H
	2M4jLg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j17yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 16:30:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aed1b64104so6374677a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 08:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794501004; x=1795105804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQyWXo7MbA+VXzM7rtfZ3B92+0RgCk2H2hIoqilD3YI=;
        b=GvQ0sUl9USKpppKxy0RgZEjLN0xsILqFOsIm15birUuVwZSQQXuiBNWSJE/EHCykc9
         5eMD2Ws7NgwHasIEeDt7j4Se+F/BJvjHGzB0JODySRGko1MMRSd6S7vQ/6RxFRWw/hQ9
         RA6B5V7+mcCrL17JFwDMS0CdR3ru3gAOS+cdQoSP4pzHdKOQab/gu3LcFTvAlzZY3eN0
         rqNIp4vjdhV6vjvjnPN83za6LIWDW9jCnXv3R27T/vwFNfPXP+z/B4jrpAqLAVCLPP44
         pMLmhgeXGIr31Vgnn/ay5dZsAC24HIm4x/5pFKk6Em2aHSSQW6UaCWQQwXkh/wWJoYUJ
         P/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501004; x=1795105804;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQyWXo7MbA+VXzM7rtfZ3B92+0RgCk2H2hIoqilD3YI=;
        b=lSIPsbcwS+t5Q9FfJOxvzVHs8a0COyP+YNM3ZBdREzTtDATYVmHfkSrCu6e+sl9gEi
         p1yRpODEfvym1tktJk7iFXLa10D4MVID2i3gT7/0okwXRYBcLjmfLMFqRDVARdpxjddr
         6j0nxUTIegaDhKkPELeE52ThQFQgxg37ripCBaDgUeBLk62j7WwWlCvEhDIhFDfL1QeC
         6NwjOWiHgjXrfK8+pWjM89spZyXl6DqO9VNCKaD3DW+f4rf/XFrjLyuYxXDsj/5ArN2C
         MOYrLcoMH8ME3DsRCncfOJelXWCTAhwWcZY2ong8MRQZfJkomPwQfmfimxURQTfGv81F
         NgtA==
X-Forwarded-Encrypted: i=1; AL+hErHxeIv6pfRlyDo+CLSF3RokJIF9Ahw0JsnmlWP0R9zEmxiDq0tGRSfyf+lP2aK3fyuvlq9YZhsT27T5@vger.kernel.org
X-Gm-Message-State: APuU4Z/BXvRmHagDtMmgh3zS2MF4d/MhbMWUkBgiHKR1/6Rp93GIt6Cm
	I/AJEN06qUzk3/Rv8tnEIN9d5ca+9rt3FuPpwii3P7jMjJRffNC6mSiAiAmVy3DG3M2st+6j3kM
	IFyn0v9pzhlvruc9id7vsUcKFvMn9NlomODe4E1CHnRkTbBwaeQtHH2CVCKuFVkzV
X-Gm-Gg: AYBFou0Yw67NHRVPZfo56WLsDlMswHwjPmHUTgxe8p7mqD57xXhNKWbOpPBpBdnoA44
	gxli6PYIY0qvZzXp8T9Wrikx5n53TKj/kvSTl4gyZFAouTSgftRep96ynf21mjcSkZqEHEcF3Ko
	rSAM08hfUl0RUkoJ8aVx+BrjdT7QsRv7UFrfPTxdgehrMqw225RXtBAuADb5mOlIGxyYhwp8NuH
	zM66vrnFCZHY5afxOlMNPxAbbQFIXhNg31d9lBoreDm4SSK8qtwTOUy3dAe6jnEDJnk9OS/JGhP
	VYBIW4nBNgSX9H+x6bIxB1dT/j4nIj/lVWHtZFCbxUEq9Sy5SY+w4W8PADaEnGRphbRZBICQcVg
	arZqgWNjILJx2eNn3gUm3GgIvqzLjvXsybDMEDi6WuRQpnBsPVEA3e/aX9U9OUIavHcMp/v5vqI
	jTAis3KplfUTj606M=
X-Received: by 2002:a17:90b:5483:b0:3ab:188b:c5bf with SMTP id 98e67ed59e1d1-3b182e9455amr6102032a91.18.1794501004382;
        Thu, 12 Nov 2026 08:30:04 -0800 (PST)
X-Received: by 2002:a17:90b:5483:b0:3ab:188b:c5bf with SMTP id 98e67ed59e1d1-3b182e9455amr6102007a91.18.1794501003901;
        Thu, 12 Nov 2026 08:30:03 -0800 (PST)
Received: from [10.239.124.252] ([152.59.198.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17853sm78492a91.5.2026.11.12.08.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:30:03 -0800 (PST)
Message-ID: <7d55b69e-f1cb-4271-a2ab-2cfd2e1947bb@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:59:57 +0530
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: sm8650-lpass-lpi: Force runtime suspend on
 system sleep
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112-lpass-lpi-system-sleep-v1-1-438cb997e0e9@oss.qualcomm.com>
 <b64cfe8e-7274-4a8f-8add-ee1b60522c42@oss.qualcomm.com>
Content-Language: en-US
From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
In-Reply-To: <b64cfe8e-7274-4a8f-8add-ee1b60522c42@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NSBTYWx0ZWRfX7Ruo5Wq03neZ
 UJipuzCxO0erDOXJe16RNJZBVw/Iav+CTVdY4hV8z5KUzFKGZl3YP9VG+EGdgtQuZUzsBzyJJAQ
 jFhIZ/c4MElRZEAWj9AHhCvrmjTS0Oo=
X-Proofpoint-ORIG-GUID: fNoQlJ94ikN8Fk3z1yZOp1jfSQteF2Ho
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NSBTYWx0ZWRfXwaNoOCPc04Bl
 3aSEHw7lmSDEye46Vmq++Uv/xwXZAid0UeP4A2ZUnXejPCifIKTbXmBF7wq6FEcvWykjO92Og7Q
 Z6aAPI33iXdatiJFTTUPlFoHLCTTAFZysikbi3GKqPUojZoFRVPhsMHG4xZOPVkQhJyUY0yU9rz
 zq939k0eYNrg2K5bJwaX34zmMGU3Q4y1dzlmEZg6pI/SX5tvm04NMZG4SlL9qVu2NbwzqRL3CeS
 qWsHWpQqLNPi1H3OWrcvpPCPveL3IVLII3B0XmoDzuo5UtrWePjzymJjfs7XTitfFYYWr/8JbWE
 BzVwTS2p20hNEZVLtJAZSAZ42TXepMjYhKTVRz4vGSpJ2gCfkJy9u5pelx2LM+alNkbLloPq+tv
 f+xIk4REoLHBUFZkRIlFGFY6rUFOe6Ti0GFhB+8sGsrw/WVkTTHspw1Mt8k12XgkMQd5mkkvSRu
 C9sHn8ail8l9SANYRyQ==
X-Proofpoint-GUID: fNoQlJ94ikN8Fk3z1yZOp1jfSQteF2Ho
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af5e98d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=oj49PQJ3kor0hQ17X0pI4g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KVmVSDkxW8-HW0ZFBYUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120065

Yes. All the LPASS LPI drivers share lpi_pinctrl_probe(),
which manages the clocks through pm_clk with runtime PM, and every SoC
driver has the same runtime-only dev_pm_ops, so they should all have
the same problem.

For v2, I was thinking of two patches:

1. Move the dev_pm_ops into pinctrl-lpass-lpi.c, export it, and use it
    from all the SoC drivers (no functional change).
2. Add the system sleep callbacks to the shared dev_pm_ops.

Would that be okay, or is it preferable to add the system sleep 
callbacks to each SoC driver instead?

I can only test on Glymur CRD (sm8650 driver), so the other SoC drivers
would be compile-tested only.

Gopi

On 12-11-2026 17:27, Konrad Dybcio wrote:
> On 11/12/26 11:51 AM, Gopi Chandra Sekhar Reddy Kanala via B4 Relay wrote:
>> From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
>>
>> The LPASS LPI pin controller votes for the LPASS HW_MACRO and HW_DCODEC
>> clocks through pm_clk and only implements runtime PM callbacks. Its
>> consumers, such as the SoundWire controllers, keep it runtime active
>> through their device links. If a consumer is active when system suspend
>> starts, or is resumed during it, the runtime PM usage count the PM core
>> holds from the prepare phase keeps the pin controller from runtime
>> suspending, and both clock votes are held for the whole suspend. On
>> Glymur CRD this keeps CX and DDR from collapsing in s2idle.
>>
>> Use pm_runtime_force_suspend() and pm_runtime_force_resume() as the
>> system sleep callbacks so the clocks are always released at system
>> suspend. Consumers are suspended before their suppliers, so the pin
>> controller goes down after them and comes back before them.
>>
>> Signed-off-by: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
>> ---
>> Tested on Glymur CRD with next-20261110. When s2idle is entered right
>> after playback, the LPI clock votes are now released during suspend,
>> after the SoundWire controllers, and restored before them on resume.
>> Playback works after resume.
>> ---
> 
> Should this extend to all other pinctrl-xxx-lpass-lpi drivers?
> 
> Konrad
> 
>>   drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
>> index bc7889c993d0..e33d4360c094 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
>> @@ -220,6 +220,7 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>>   MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>>   
>>   static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
>> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
>>   	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>>   };
>>   
>>
>> ---
>> base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
>> change-id: 20261112-lpass-lpi-system-sleep-70c4d2239abe
>>
>> Best regards,

