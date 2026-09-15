Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A986A43C051
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 17:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494873; cv=none; b=cGw2VyddyVbCnBGRH6+E7T+wtyPtZs3aCz4XMY6remd3LG7kIa61EQRuG2G7laWAjx2w1V529giazDeMEwOB1yXA8QxEo+Dc2BXXPX68R24iUUgywRZMXM7f02ArEBnsRIejyWn6b/9pUelVTAfCGvfTy6EQixM/UE6u7PcbDrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494873; c=relaxed/simple;
	bh=YV+k4MpgNhuJvubvbw3E8ZSBt4xX9OCbd5YX9hWrDMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WpGLo5lYtD/JxNRaK4iCy0Ojyiqu7NFDd4zOjxOzx8zwtuCFcXrZEwKvYsSFfyxdr7GQb9iZWpCkiDAG3p55zB/0TupsX/++fzZ6HNxPMlBQAtUWmgoqHGppRCuXoPKrjwthOqmgZX+cUOSRQSN+t1HJm3BbCIYwmdtIMnuEXjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pu/ZXjEW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjxIwboI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pu/ZXjEW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjxIwboI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FHosjZ349765
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 17:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YV+k4MpgNhuJvubvbw3E8ZSBt4xX9OCbd5YX9hWrDMY=; b=pu/ZXjEWueQEkxFn
	XvJs+PUx190FjwthFylFreyJFrrKuPIMCq2q7+rVORYQUDvK2ExhPinwx5Dnm2lm
	kuyMPnZdiumIBVgN9DBgzp4DXaR0uwOLZG5+0A7yFkBErBaPIDm6klfAzd4XL57m
	LXJ/Y8+VOf5ipfmuWF2cxvgd0XpYuy+4ILGoirJGNT5oskuA2gKoCl4+FuRuGiy+
	OHnrrptejOuBCLWSfVX4vvmCdVXSzJ9d/jU0H0pzk0AYwCzNupuQJxpOkd66IyoR
	2ZXecJT6vyTclA+TDig9c1OdzUsZ3ayuWlPYXrgy7L84C6k/XTfhNa/NPJHTzIu7
	lWEeXw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc2u8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 17:54:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39dfcc20aeaso1840975a91.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 10:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789494869; x=1790099669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YV+k4MpgNhuJvubvbw3E8ZSBt4xX9OCbd5YX9hWrDMY=;
        b=RjxIwboImMRcxBuUPCm9MFuZToYKAUpVF9KT6JpOefQo0smEFyJAtKXvru5vdLTbiu
         5odF0FMjXYixOCIdEzm4Gz7dPeaWY6oukXQcHDXeRU5IZI4lc7i4folqJFMv/97Nv80Y
         aZZMHDezMeUT+mv3ab/Iqex7ZJZdP3bZz/60ibBYV5dyk9Rugd9js6CDKChi+DegBEV/
         DkkB0OpO1NTAVTC1+VN3dS9stVbgC2S36GL7buMQdHARjCqgyEYFWjFinPfVuZoAMAWd
         XOaMC3VrbzT753e6AZSIOMNQksPGjnSj+TnI5+QHFigNWzg0DOQqoU0KFULRbHpCo2wL
         eJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494869; x=1790099669;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YV+k4MpgNhuJvubvbw3E8ZSBt4xX9OCbd5YX9hWrDMY=;
        b=qjeqrdXUJodHnVs0mDMcZBJ+9xSEgqL+qBIzjZPbABydY3d3qDYYI5jIdHVsr6wsoC
         VtsmOeKdNbOVQ5Ji27x5zNNQg/KBspJI7S/UsoFFaoqEW5YIr3HTcXCtVZs5CUV6N1Qx
         Twmgss4tu4RwcP1MbGf1LNANYkwHfBM+YrL7qIKTZzT++ceGv2mIno50BZ58WPa1Us/E
         w7gXi1DKm8uAeuRs0ejgUCTK0a98ktOT/LDkaSoo0TlYYnpVczjNEcLzhCcEmC4NkL0p
         b1ZAP0YrPW2Pa4FAaHA0qVCy7D6qSsuJtx6VnH4vE358L9vlzTk9d/ptMZI7Cl+jMHZ8
         OMaw==
X-Forwarded-Encrypted: i=1; AKwUvBwS0hCNb8gKlej2vKKGnqz+ExdcHkgX4b2jDfd0OZ875odHSJS6EEAXSSr38sAbnhcfaV3ErlaJpfk5@vger.kernel.org
X-Gm-Message-State: AFuF++lfAPGYR8RKBecFJL/YbcY6KlInHgTQACwxhb5z4bsnJmlyDRIQ
	3Y1b3irmSpzUL+G2DAClorY26A5BX3+C4b6624hrI0n7Qje0nwczHTUDylX86LOBhefa7AnRdDu
	tFErZnB4dKKwXWSdJomeccDW1Rx4jBBQ0aths/sudz7r17wOIUkv+Imal9dluXE+USPmTQ8NJ
X-Gm-Gg: AYBFou3SX53xM0YpP2x5Y1FS7cPeD9A20z/bcUa6io8UnQwto4eC2x2YTCY90yB0Ifu
	QWvAw0A7C534/N6D3xIqq/cWECorfghqj+mZrocMX3oZKIFQGWxLjyC0RxZjYE4c5AcU3IQs6eE
	g7KdPuW4EQU+MQQ/SpdyvDO0b2RuvAN35zy7OOKfpsybR+FXdrfryNYBfyOehztJtC7Nl04LImz
	/VPQLdp/XxTwti3yJ+cFhJBV0GYFxfNysPB8wjGvpxCt3R+ITzjbk/j1SZux+G4YjkQ6mqXAnX+
	fPBO/PLX0IjKAE6V4rG079a8gmWGo7aSHJmK22a3bOu52BRlPcXgCvD20ca3zp5u5Z91L1eFxQR
	QmmXtj68pN6xm2H5qpIWG55+P3Cavekw6fHcCswNtg/xwaQ==
X-Received: by 2002:a17:90b:28d0:b0:39d:f5b1:e35f with SMTP id 98e67ed59e1d1-39e11095fcamr4218083a91.25.1789494869082;
        Tue, 15 Sep 2026 10:54:29 -0700 (PDT)
X-Received: by 2002:a17:90b:28d0:b0:39d:f5b1:e35f with SMTP id 98e67ed59e1d1-39e11095fcamr4218025a91.25.1789494868480;
        Tue, 15 Sep 2026 10:54:28 -0700 (PDT)
Received: from [10.177.238.120] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d13ee7sm306945c88.8.2026.09.15.10.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 10:54:28 -0700 (PDT)
Message-ID: <362574de-c709-4e78-9b88-4bc4e0dd7c7d@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:54:22 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] pinctrl: scmi: Replace get function and group info
 with generic callbacks
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
 <an7RL_mTsznZjeIQ@pluto>
 <56107a6d-962d-4508-a1d3-7a6e9e2af887@oss.qualcomm.com>
 <20260907-airborne-cobra-of-democracy-a9c411@sudeepholla>
Content-Language: en-US
From: Alex Tran <alex.tran@oss.qualcomm.com>
In-Reply-To: <20260907-airborne-cobra-of-democracy-a9c411@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: N8fWqnm0iuntbMQXbbBU3IrxHCllZYzD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI2MSBTYWx0ZWRfXwGmcI8DrbYn6
 jPqk2LZLuphUIDMAPorXDkC6P65QOhX3i6VC2ahZykpUVGTTrx3VWeAQP7eFDlWtHOlBw7JpPxi
 novZ429NHyt90s4QpV18vzYvng+1os0=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa98655 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=8qBNkTY05YfpeKCp1UkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI2MSBTYWx0ZWRfX/ZxWpSmk4PIE
 vgeaTnZFS0KXvRs1PGiS6kncNm8zbWSCJtwI/V4tVKivZEU2k/8Xa4mH02oH+QLxCfwQaCv1Jrb
 Y/eOWv9xTAX5opWO53veBT26F8H4r2lVRh/xEL+qjZsulQ4pfZj0i1aL2c3i2FwUDiQDHkv0vaJ
 g31ykORGKZuuLUxoyQtpPpIoBUCSZUnSHsoftKdm9rXxXlmghSoSs5Y81Tmhae7Z/wN0C/h4t6W
 Eutg4wcppIcDpdU7lFz3kG8ysxEB+fjDbK3JRLr6bRBJL2PZ6hkGpU47w+mri7RKelOXzYwJWir
 tZXIgdC54H3drucAJJoCiNvDW2EYwqNK9UgIqiqmaK5bFFiY6VVVIO1kM7zL6V223sOS4JLePQl
 8HjX0Z96hVWc0H7r9qesI73QtIAnZltFtsOYnDTVy5gsb5i3pWL+oTsPaJBwvHSjZJBRxTQRnCx
 rFCx6DQl4EYEttR9K2A==
X-Proofpoint-GUID: N8fWqnm0iuntbMQXbbBU3IrxHCllZYzD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150261

On 9/7/2026 1:53 AM, Sudeep Holla wrote:

> On Fri, Aug 14, 2026 at 05:05:27PM -0700, Alex Tran wrote:
>>> Hi Alex,
>>>
>>> I gave it a go at this series on an emulated setup and with these
>>> changes I get:
>>>
>>> root@deb-guest:~# modprobe pinctrl-scmi
>>> [   15.329932] scmi-pinctrl scmi_dev.4: error -EINVAL: Failed to register functions
>>> [   15.330259] scmi-pinctrl scmi_dev.4: probe with driver scmi-pinctrl failed with error -22
>>>
>>> ...not debugged any further.
>>>
>>> Thanks,
>>> Cristian
>> Hi Cristian,
>>
>> I've tested this series on sa8797p hardware and did not experience any issues
>> with registering functions during probe. Can you provide me with the pin
>> topology of your emulated setup? I have a hunch that the topology may
>> contain a function with 0 groups which is why -EINVAL is being returned.
>> The previous pinctrl_scmi_get_function_groups callback considered a function
>> with no groups invalid.
> I found couple of feedback from sashiko valid, can you take a look at all the
> comments there[1] ?

Hi Sudeep,

Sure, I'll address all the relevant comments from the feedback and send in a revised version once ready.

BR,
Alex

