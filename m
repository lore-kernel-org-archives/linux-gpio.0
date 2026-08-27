Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60CF495038
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 17:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850116; cv=none; b=maqlws+/aC5kFmBiLcCEGURyWLWYkcY+RSs/2uacEenKLaJiV5Nw4DDy+3ntyNZLUY47QhjsfMVEe+Xt3SA7z2FEAE1bxEg9/8wbVY32OxwfoYpnvQgATwUrM4ednmsktiIWyKsVo1ejpQrdNelCZzjivlg/D+NiWsY2q2WYD7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850116; c=relaxed/simple;
	bh=VLth3SEu7qG3r5aWNeqIN5rjqfJQ3Q9Ak0EseKunHjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZTDzdsaYVcMJy03MVb1Ni4+0iFgER+WY5/ccNaldH9HWOHhMehe6hV3G4yDYZeuS+xn3+MBoep1Ll1/e+UjVPqP95Jf9B4bLWzxDvYOBHfg3zjSU8sQoooUbdZqdv+FfMJVJvxYUyatPc30Gr0EpJ5JQo+gzMMmcQritOLCm5gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jecm9R01; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Umlqj17J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jecm9R01";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Umlqj17J"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RG4HSZ342245
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 17:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ZGn09uCQecSpHGhjI37UCupzc36L0CgFZmzAcMQoKM=; b=jecm9R016Au4SOfa
	9DHqvLJPactOk7aQdK/C4SVlQIDFnr46AJq3kT1lRpuuzEuEStjSDhuWZmBgFhwz
	+tgf26c9sVpNxGmxBxVJKgPo8eW8YRfojy/11FRy9/tXbIUvFT1TfgQ4KI2g3dio
	U/qubr+FLspGfIB0dJYsqmwmjLn+q2pPEB5ISe67RM2QzunWZDMDi+jnlzc7hGIH
	vBhKrjHxmmNe63U6F8+esRq4NhYizZhKei7/m+4Ujojc7EZ7NDs7M5w7jdR5CEPh
	yVwGzKt9J5X8o3P1gx6ZSVuO8ThEdUAk+MeKeJl9E8tazr0mt+TLc3A1As2Jakl0
	MWu9Bg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garee07wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 17:01:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8544b721ce9so250770b3a.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 10:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787850110; x=1788454910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZGn09uCQecSpHGhjI37UCupzc36L0CgFZmzAcMQoKM=;
        b=Umlqj17JRtiVoyDa42/OpuypxTSUCM5VnbGWWtbswpMLHiBHT5hTTbPanOvf0ZZNxA
         cjH1odyx6JVeqB9gbobnGy/ckw1ECn/E/sTWLIPiZYD7r2eLkBI3G3qwu8JMWHi+lKAp
         1S+30KAJcQSav1Orw2k65VMWmV5l48SId+D0jPoS+nMw5vEM4WByBWuzPWoSDXziZi/Z
         zJUD4OKDkfU/5pnQe43nbEsND+OTR5JFqCBvNCsp9de+8p4CMTNhzU6ABkpkoC63hrQV
         7xLJSqTmKe00JuOrD3k0M5TQCVXejmzcx1LMCnQonknkBsQO1OtLfF+myeyNMtxMCkj+
         bS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787850110; x=1788454910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZGn09uCQecSpHGhjI37UCupzc36L0CgFZmzAcMQoKM=;
        b=sA6EzMdUYDNEf0CcD/fy+oNrc84aOlyKnX7o+XKAa/xSZDcSX4z5LM44HxvIZ/xzDI
         G644Zzlo25B7iVpvM0/uuewC5GCIDpd6aAY8dn2uwB1XXFtUKp7yB0a6IftUsv96AoJI
         F/BUmfrXwAaqov1hOWdTMZxz7l+v631mzDnDkgjGitMjsL000uD1vx7A2wvXrISg1/Ee
         tuNmbalZMcEWl7x2b/9fEF5FwTFI/+a//xMcjmBXTfKdtMd3MSD01U7sE/G5u2n6NI73
         Im+0qczLzE3vyiyDjvK4B7lu5xYMpEUVX1X8jYUCyPDdRYJiRLQqQrPh4psVq5F43gWC
         0ADw==
X-Forwarded-Encrypted: i=1; AHgh+RpirB1OcyZ/D4AB7+mkOFp+e8bPXGz3578ovhWM20AyvxHfxvCCo6v7LswVPFKbV5OjZ6v27TxWuagt@vger.kernel.org
X-Gm-Message-State: AFuF++mzkAxDBqjVqONv4/clqdfovCbRsTrcLxCPeF0HI/udPmM3088i
	kN3O3jcrvkB8vHYrAVqfLk9RsIfp59yCuNDe8jMFs/9R02bJGfnpcA1mSrVa6XieFvotZnqJ3Cs
	U47mBPLUVsI03OTCt9VwQOT8ypRRdPfwGSMTNS/ixr5n3+Bc36EpHXl0tuIn/182j
X-Gm-Gg: AR+sD12+COtYfCqdlu5uySr3kKd+yk3O05gVSN2LjTC1xhlWGF4Bs7HqYcz441b5lmF
	glK07kksIhTuW7x0oktVR4T0xbn9HmH193lgGcGl74bCbpSE87inR66aMWO+OWoHymXDMW+Lv2m
	kPapPG2qfv7mPPfLZhNToJzFds4rGiNSBznpMiQ6Fyar8Abs3QgAVz35wdEjXxK0nD8KtzItAlW
	34H2pfOX5EJKAyVFHLK3M2nmWkGrbUOBfSGSrXuct9cWtXhzw9YeGG5EQGNZNyjOVQ7eR7q5rKe
	Yq8tmxLJp5eleCpI0jsFEXQoGs0tHR0bXYb8fTA06bBJDqtiGWA54qAzljHKb7+PHbnJImI8k/D
	IBW/TzGc5GzSk+iEW8YZFYVqaf27bY1c=
X-Received: by 2002:a05:6a00:4b41:b0:847:9aa8:d3bb with SMTP id d2e1a72fcca58-8562953f64dmr1115444b3a.12.1787850109615;
        Thu, 27 Aug 2026 10:01:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b41:b0:847:9aa8:d3bb with SMTP id d2e1a72fcca58-8562953f64dmr1115017b3a.12.1787850107481;
        Thu, 27 Aug 2026 10:01:47 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535cd81d22sm2404824b3a.35.2026.08.27.10.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 10:01:47 -0700 (PDT)
Message-ID: <4466c3eb-4de1-4240-8fec-765a4910b217@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:31:38 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-6-196e2b306368@oss.qualcomm.com>
 <20260827-predictable-mauve-catfish-3d5ad0@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260827-predictable-mauve-catfish-3d5ad0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0NCBTYWx0ZWRfX4hkcfdgDxUaf
 M99NbC0T4gHfvCgNt/b8oBvqWwEApdAbCys1boDpUfDMMrYrgoiRJMOCVEN8JO3MV1qWGEzrSCB
 ghCtNUCmxz/Bs8FXVTRkbhtXsxayrzRj8Pzz5Tz+vVr6f6idP7Sc1SUIeUasthfpTwxDnoswm/Z
 +eV2pi4GWDp8OdQru0boDBHAwbmrTwLfdxjopO7fyjyOBcXDTOaMY4uovRywhwkTwH6aBeSPpdU
 h3HLDkI9mEgk+u6qI3KJIJvJyyg1/xf2LrsbI25RquHbQYEZS9At30wGxCldPxTbUy2NX0cplJN
 IlWGN+X7lfHTBCB6mRK4nIiNrVk6CJ0arFEQYUpDtXZhHZhW7qJCgfxYBEFELWeGYyV5rhx8Jmn
 Tt2XZHZZHgCEaoRKC/UtYiJmuh6tK46hx8F0ix1ViJQJYnxo5ZeSS/sbCfzr2qnP4ZxJZqF4JXl
 5B5lw5SjZ5ZuaKdhx6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0NCBTYWx0ZWRfX8M/+/pm05dsC
 /nVgiZOQ2Dqz5ZWFRZSM8UZc78SuMm/FS8rFKUMexcJTugYgtHH8GHCKqHeb2c+WZvWPc3807rp
 vjzvi4tvz5s0jnY8uBWw45+ZuS4YC94=
X-Proofpoint-ORIG-GUID: f61yule4Q-OXMO2MTCTdU6hhtG7W-haY
X-Proofpoint-GUID: f61yule4Q-OXMO2MTCTdU6hhtG7W-haY
X-Authority-Analysis: v=2.4 cv=e8E2j6p/ c=1 sm=1 tr=0 ts=6a906d7e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=WTDSa4fX56zQulHxy5BIwg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XeEooGCi7Zy1lAdgIjAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270144


On 8/27/2026 5:50 PM, Krzysztof Kozlowski wrote:
> On Fri, Aug 21, 2026 at 09:38:59PM +0530, Hardeep Sharma wrote:
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,kuno-aggre-noc
>> +      - qcom,kuno-clk-virt
>> +      - qcom,kuno-cnoc-main
>> +      - qcom,kuno-dc-noc
>> +      - qcom,kuno-mc-virt
>> +      - qcom,kuno-mem-noc
>> +      - qcom,kuno-pcie-anoc
>> +      - qcom,kuno-system-noc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
> Missing minItems. I asked to open other bindings to see how this is
> done. So for example you took qcom,maili-rpmh.yaml. What do you see
> there but you do not see here?
>
> Best regards,
> Krzysztof
Apologies!!

You're right, minItems was missing. Fixed in v4 by adding it to the 
clocks property.

v4 : 
https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/ 


Best Wishes
Hardeep Sharma


