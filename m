Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E8249C4AE
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 13:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354220; cv=none; b=fj1IZ/iWfTxn/KZdKOfp58ubipOPoww5jNPI7tpHOZUS6vpG1JOm/YHo3flJ59IafJ9YfKyNvzbwHI97bhxoOwOGDS9nBxx8sHwSZETdoWLt9A4L5DsFFXwut1tXmgCNeCXsLtaRervKLP+k5R2vR0DgXI8rekuyPHGp6oQfodQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354220; c=relaxed/simple;
	bh=G0hw/pezIlFMRhmrAIQvb2RbWY4suDlV/OtR8kK7ktA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLpn2++/7h0OXJrIxT5ZnlM5HbKtGwxEJQaamr2JGRLbrfpCbEApE83oyUaPWjlcyihG86cqVHLy4SNv7Q4+GguiGhwtu9AVdhLXQ3jofX9VL5FnoJ6tz0BxVMi0dq3iRORI9POE4dZSsUaPbfJim7NH0ylnEI3PD+Ld1y5GKgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VmL9jYrH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnvYOGQF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VmL9jYrH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnvYOGQF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CRH5x2001805
	for <linux-gpio@vger.kernel.org>; Wed, 2 Sep 2026 13:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkx9v1DF+Zw7it7PU+0H3Z4Av/8FoowJS7IAu7u2yc8=; b=VmL9jYrHvfl8wqk8
	D1B45ze0zrmlx2+vSz7eFAq+aNNbIQrwMGgmNUQafvQvsRCFeoANQX/Ocz00IAc4
	8GZ2/SV2FelOKLFCEQjx76ryndQW2aAr6vVNvA21rS8yENcc02A5FeD/wpX7lQPp
	uXbBvxxnp/X5P/cwTGsIrptwrpeomsSHTFqbWdog1ucjT3xggnFXytDQiu6EMwiI
	Np72QiGQt5QAWebvHetj2CSExlgPZ/H5fUouQqqmKAFJ+q3+GdUzxrO8vqtBx/Yj
	HCA8axqq+Dqvm5B3MQUly7PB5dSfRCkIU7NBeLY+uACEHHitdbJS5ewWFhSA74bR
	ng3FFg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy0w13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 13:03:38 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7530aaa7212so24384137.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 06:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788354217; x=1788959017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkx9v1DF+Zw7it7PU+0H3Z4Av/8FoowJS7IAu7u2yc8=;
        b=AnvYOGQFhpevZuq2oNqsKOqSI3rizvxJXj3CZeYD1lIEw9JwpJ7z2ORGPE7prc5Sw6
         WO+JrtSdItsHwgiKncsh2rExpo2oqfi0R+lzywVu5cdN5RShUrAX9RY5NyQZW4sN165j
         fDk709DdO0L4FiMuZl71jghHm9r/l4GQseiS4hNXmD93ZHmhqVxcOIJ76FoMbxwYBVQR
         O3wB7LOo6MxU3abRFJC6+UpfKYO+HneQDHAT/sEOqxx+sI5EYhg4ZByPT8X+xvTtaCdW
         dX+F7QmVFuIqKrGwNGlm0SOUqUU682IBh8uU4L2tb4e4zsqewr8l5JJtDX2ISUDykiKK
         BjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354217; x=1788959017;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkx9v1DF+Zw7it7PU+0H3Z4Av/8FoowJS7IAu7u2yc8=;
        b=sKxQi153OQ+y6qCTVJN/Tw76k6aRTZSp4LDnFRPcWDyf4utvAkF7QhRKtnhjciQsBc
         l5UeKfnWkhxtjcrSZGr06HNzhD1mVW/93TLDM+pbK9FHWMfwaWDcbcARG44AVdpBUoX+
         qIQpLgOD+W01qx1ZA8hJgcfm5evrsR+N/WAucbEBl9TPxmFnL1sXZH2C+vcSpQVzMgjE
         3BXGLSVvy1xNh0rpwmyeOdzm+aNr8XG3CFtPCO6nbfu0c6zEYh19HnMzbzDVIncaXJL9
         S87G1oqd6hIMRJ0E7r/kkBduhN+nNOn3ztlFuEK/OIpRLsLC24Q9Y2ZtchxwkqEkvhwu
         NKQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcVf9/C/9dEMoMagJgBP0nIdflR+U/jRz2Txq9xVSI1VrwJBN6PT9n5gzo4r5o5JLiXV/aYXSnvPKa@vger.kernel.org
X-Gm-Message-State: AFuF++nS2BuWsZVY3Z5kCsphN/0XUmdbHVfQGGHfl+k5z6Tg96mrV/GC
	AxH2HdM8OS1IDlSxqplrnrqtNy8otBWFCqwbdaRila5sfaPAv7cgLLRABOu+z75PexaJLQ2n10K
	TBKJGH/tQ+FRghZmEBKdIb7A7OIPEWwfEvljrNCIBabnOO87I3mqvJ4Y6vBiPC00r
X-Gm-Gg: AYBFou1hn5WvoHO2dW0ZVbswDs+v/0t9okGS3R1UPZe9f6iTwyA9UrJZN6EHSD5Ghem
	D1V/xkvUXTzFaE/xhAg92SfSDPa7P0LPDs3jEtJ9dqDi7qCb67HckyObxqtmlk6mmqLGXlrQK68
	wUzZeanB81GwWPsHo+eqGRF1uaiqF1VWAUM7Hs3p6TPgur2T7Oar3ilEysE/Lr8OEKhAyhd5/Ez
	OA97RzUHOtsDOa9yBTmUN6ErbYCsQCboh55FmMXjfbJuCLlcClXOOA4eN6GCJaJ5Prx0QwvkZpq
	DVdGGu8sTFCNDQG0O34Ea4vQcAjfuxaPBR2Cc2osjc8rlsbWmWGvZy3VlUZ6vyvHF2+h+1pRQFZ
	b0vF5Tl5PUDtynGGeJrkr4481FSWhwXkFLA==
X-Received: by 2002:ac5:c84a:0:b0:5c7:d15b:5f2a with SMTP id 71dfb90a1353d-5c7d2809352mr421637e0c.2.1788354217360;
        Wed, 02 Sep 2026 06:03:37 -0700 (PDT)
X-Received: by 2002:ac5:c84a:0:b0:5c7:d15b:5f2a with SMTP id 71dfb90a1353d-5c7d2809352mr421601e0c.2.1788354216857;
        Wed, 02 Sep 2026 06:03:36 -0700 (PDT)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4761dd1sm41932925e9.0.2026.09.02.06.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 06:03:36 -0700 (PDT)
Message-ID: <7eea6a82-6bcf-486d-9c0e-5a68c34c03de@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 15:03:33 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
To: muzafferkadir@mainlining.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260820-msm8952-pinctrl-v2-0-bf2b8b7b379b@mainlining.org>
 <20260820-msm8952-pinctrl-v2-2-bf2b8b7b379b@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-msm8952-pinctrl-v2-2-bf2b8b7b379b@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a981eaa cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=OuZLqq7tAAAA:8 a=eYqAknA8CWvG3Flig9cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: VRJ0Ej7fCRypcn16oPOYuFIsWOvFAdTD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDExNSBTYWx0ZWRfX3uYuSruzwAhU
 dHN9sW8tcwmhVRMXLVG0tAoitdyZrzu+E6qPXWb6DLtW2YEs12o7iVvE6eeLRHqMBnK10uPplh/
 9eOrI2SgJglQeuc6hITfJZiQi6mzDsk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDExNSBTYWx0ZWRfX7cKQrLUVM5bA
 ng6XD3IKAKLhUwhBDiGKFAJiFkmTSvdFls9y09tBh+soXxt15aqo4DY3Yv5quuEev00uZWedXCe
 fkuWiUIZCFkw/SZcDCqJX3/72Zm2d2h0n/e/90PbcR69Icc96U8oSN87GNUZq8w5mBZoa7RnnyO
 tG6H2eCE/9pxMVm0NBe7YdDFtAHh9Zfhl4QN+W03bDwENBPv3KDLDLh7UxwzZDpYTK0RTO5xMgF
 npIUC2O/LgnxWaqyPn14kJsNTiD0Q86p7DYDg3c1lhS+IBFUAKgnj7jRzJcujxop0gODLM5CTc1
 f6TGGPoyw1UPbQ//Jaeb3ZopU1hg6oHHxxAcTVpa6857RFK62DwUHkZHbJklz70W2Rlf6Ydv+rb
 b5aMlI19jqqhracASEyu7BZW/SlozWXZuNrEKmEtAA791zuPBp7xX1og0ZBtv3In4UH5iZI1zwJ
 yyEhgxaYbqDtR4JUTmg==
X-Proofpoint-ORIG-GUID: VRJ0Ej7fCRypcn16oPOYuFIsWOvFAdTD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020115



On 20-Aug-26 13:17, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> MSM8952 has same pin count and similar pinctrl
> functions mostly with msm8917, but some functions use different pins.
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---

The following is a review from my AI agent who inspected the
hw specification and prior art/review feedback regarding qcom
pinctrl. I read it and approve of it:


 Hi Muzaffer,

  The driver currently contains function/group declarations which are not connected to any PINGROUP() entry.

  For each item below, add the function to the corresponding GPIO’s PINGROUP() definition:

   Function                GPIO
  ━━━━━━━━━━━━━━━━━━━━━━  ━━━━━━
   mipi_dsi0                  0
  ──────────────────────  ──────
   smb_int                    1
  ──────────────────────  ──────
   qdss_cti_trig_out_b0       2
  ──────────────────────  ──────
   rcm_marker2                3
  ──────────────────────  ──────
   qdss_cti_trig_out_a1       3
  ──────────────────────  ──────
   codec_mad                 13
  ──────────────────────  ──────
   nfc_disable               16
  ──────────────────────  ──────
   nfc_irq                   17
  ──────────────────────  ──────
   flash_strobe              33
  ──────────────────────  ──────
   cam1_standby              35
  ──────────────────────  ──────
   cam1_rst                  36
  ──────────────────────  ──────
   cam2_standby              37
  ──────────────────────  ──────
   cam2_rst                  38
  ──────────────────────  ──────
   webcam_standby            39
  ──────────────────────  ──────
   webcam_rst                40
  ──────────────────────  ──────
   rcm_marker1               41
  ──────────────────────  ──────
   accel_int                 42
  ──────────────────────  ──────
   alsp_int                  43
  ──────────────────────  ──────
   mag_int                   44
  ──────────────────────  ──────
   gyro_int                  45
  ──────────────────────  ──────
   pressure_int              46
  ──────────────────────  ──────
   fp_gpio                   47
  ──────────────────────  ──────
   fp_int                    48
  ──────────────────────  ──────
   us_euro                   63
  ──────────────────────  ──────
   ts_resout                 64
  ──────────────────────  ──────
   ts_sample                 65
  ──────────────────────  ──────
   sdcard_det                67
  ──────────────────────  ──────
   audio_reset               68
  ──────────────────────  ──────
   codec_int1                73
  ──────────────────────  ──────
   codec_int2                74
  ──────────────────────  ──────
   key_volp                  85
  ──────────────────────  ──────
   key_snapshot              86
  ──────────────────────  ──────
   key_focus                 87
  ──────────────────────  ──────
   key_home                  88
  ──────────────────────  ──────
   backlight_en              91
  ──────────────────────  ──────
   lcd_en                    92
  ──────────────────────  ──────
   usbc_irq                  93
  ──────────────────────  ──────
   uim3_ldo                  96
  ──────────────────────  ──────
   wsa_irq                   97

  For example:

  > static const char *const mipi_dsi0_groups[] = { "gpio0" };

  must have a matching mipi_dsi0 entry in the GPIO0 PINGROUP() definition. The same consistency is required for every item in the table. The gpio function is intentionally excluded because it is inserted
  implicitly by the PINGROUP() macro.

  There are also functions missing from the GPIO table. Please add these to the corresponding groups. The final column is the function index from the MSM8952 GPIO mapping:

   Function     GPIO    Function index
  ━━━━━━━━━━━  ━━━━━━  ━━━━━━━━━━━━━━━━
   gp_pdm_2a       7                 4
  ───────────  ──────  ────────────────
   gp_pdm_1b      20                 3
  ───────────  ──────  ────────────────
   gp_pdm_2b      38                 1
  ───────────  ──────  ────────────────
   gp_mn          39                 2
  ───────────  ──────  ────────────────
   gp_pdm_1a      45                 1
  ───────────  ──────  ────────────────
   gp0_clk        46                 1
  ───────────  ──────  ────────────────
   gp1_clk        47                 2
  ───────────  ──────  ────────────────
   gp_pdm_0b      48                 2
  ───────────  ──────  ────────────────
   gp_pdm_0a      66                 3

  Finally, please move:

  > MODULE_DEVICE_TABLE(of, msm8952_pinctrl_of_match);

  immediately after the OF match table, consistent with the other Qualcomm pinctrl drivers.

Best regards,
Konrad
