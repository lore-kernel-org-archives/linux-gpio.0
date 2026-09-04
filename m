Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBE3448B97
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 09:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788515038; cv=none; b=qsm55z+oNi/kpe9WsdevYJp3L9S8/ptJKBie8nPAhNTGNG0/qukVFs8F999gvap0dCgRCOBsV6U4T1VTVS3mM1K1rf8fHNvH0J4vmRYxPtRNpza9k+TjWxTh20eBSrAXKVESfh4Ebp1zHluagUssyJrscl4S4rJmLahw77iPT4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788515038; c=relaxed/simple;
	bh=BUuamkW7WyQdHUFUJxPa9rQAVkw4TDZf9p4h2DUNuew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VyPTF7432+HFOqMZwHMBu5tf4dtIqsxVqiPNkawcjz/izW+NQtDZWvpSsFejckCQ2YwSvDX4hthEbq94FVFOVh+Ezrz7NVRXOrR4Ur+hx0zmAuvi19hsI0ycmVw2qN5sJWOq8fMGaKTXeeD+anXc06bIDCL6P5AmBHWHKZgU8rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4cyti5f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MD+YmfGE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l4cyti5f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MD+YmfGE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mpGr2292481
	for <linux-gpio@vger.kernel.org>; Fri, 4 Sep 2026 09:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WzIVwuHMN3wiT2r3c2yLfkg7g7saW/QnkVAUDv1whIM=; b=l4cyti5f5jb4QTjx
	0ZyI9QA+6Soc0sC7+UGIua1F0I8Dz0aWgQcCuerJY5yP0tpCypODgTkuoVAj9yW0
	2FNQOkF3BnJJCc3VJtESD9myqnCloZE+draM0s/qhjwleykDUQltrngnCCTtAJsC
	MpHrBIBedKFlks47F3qBtkLMsrN137RBWtN9ZVy7Vz5Guj+XNbACdMD++cJkAaRe
	FBR7kQtD9/fjQK4hztk25nx/vUzhZl100Y1Ozb+oV3rQrSVf92YtRUg91oYgjJSc
	xZBsqr9o1o8+CHzV9HtnnzGb+BJ5S3JR2awIJjWkYNXwW/DG234f/Jhcvg/L/jTf
	fCfXNw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyp2yet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 09:43:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ffd22d2b1so2072201cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 02:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788515035; x=1789119835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WzIVwuHMN3wiT2r3c2yLfkg7g7saW/QnkVAUDv1whIM=;
        b=MD+YmfGE+HUPI8vZuC8YNs6YAX4hOvbcL40h2d7ubGRd4oGvBUZ/VIb5mu0TgaI6o1
         XdGVbwOtUH9ILx6rowbJrP23ZqqhU0BLMx9JMBsizeap7j/aT4V14l1cvuex8r5tEack
         YimNK57Fao4+rxK6irgf9DCYfv2ASmXszJZqFQmbukBF4nybWNyWTyaYRWS0jFTbEHMf
         rPAh9lEFkd7IW7NHmygfe10zPV1HOoDqcU3jg+e4J9k3CQr4BW/IcwIhH/VTqMGRx/Cw
         hiYxEmxhGLfHtjqTg5Rav0GQCpTGn0xlCGNjdQWop4zNmIxGIUtUmyIPYTFAzu/BiLQ1
         2EKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788515035; x=1789119835;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzIVwuHMN3wiT2r3c2yLfkg7g7saW/QnkVAUDv1whIM=;
        b=gsext7DQe7VvuDUBCQoyA1zxVEuo8hYcN/PgSTYn9ywT0x8WXCF235fFPyDys3HXd0
         sl40mH3+XGKnCdkyWkz1VISY1nzkqy1n1c6/dmGr1fJJ3Y/UmgvryB41OH+puhtXGph3
         0Q/ETyhrr3fiPC0ukivba+xz1b1G7MmdEkNgmYUUnfuhfBcthgKk18edT819a1IohgwQ
         TC2GSvmQI4sFS9hcsD0SuMXZPWojdcktTB1NUgJ5Cw5oxwuXGznr9tg65Id827+V6iXl
         Mmr1PXqsAXFNxl0QlMdRzvfFevzz81drTdzCWjbJIxKffNF07G62Y9PXNNgf2mlclGzt
         XSZg==
X-Forwarded-Encrypted: i=1; AKwUvByuQLZ/wOHTQxLZDYnTmltAnPdTHO282zcGWncSJtzf/tg2EjxZzcPFQwLjSgDEmArMgSkSaN3sfaNO@vger.kernel.org
X-Gm-Message-State: AFuF++nK5zLq/8llcz0kSFSMoMBSUKMPZcoGgeN9vz9QODbGOLgP42Ux
	TXmtjmEsh/E4PXMky4qaO8mZYGciZ+46YNvaQFEE6mdiP+w+sX5xXiNVi1X3VU7U7R+E4FRoqAM
	vrdxDeTaKqYAAHjopC0KRWpvP1hcRo+4TgAbfDljP6z6cbdTqznXAF39X0SNJtLrH
X-Gm-Gg: AYBFou3hk8gl7LjlASuYEsEVKq7vU67+IPV/b24DOP9Bwg/us7iE+T/aN8RmdeS/m7Q
	6pMfVY9b3ezB3S/HA7rGpFINwZ0MoHvRb5lj7N9MP3uVsGIqash+hY66/bD6dwGm/64PYuQV/Z0
	QZB3YIDVqZTAzEBXO3wujTbChKFUJlgLg/Q3tDFCkSnUCmtt8ta3UKjg/loqiaSfMzWc+WUAhNn
	v0z1PLXeHQw3zaca2zVxvBqUURmmtv9WvNSSoIaTNGfwwEUeZy+KgAZkNa0NtkVixkpqVKb4o3G
	SgQNE7kI2zAAV3/Skj4Hote/bfEKMleykVh1EjjEETtfxoqqY8O+FAM/ifsLM3nT5oRiLHR13c2
	WDQfBiMdZQYrgc2jMlLJTMkq/GwZkbSzMCQ==
X-Received: by 2002:a05:620a:4709:b0:934:95d9:85fe with SMTP id af79cd13be357-939806ecf7fmr302197385a.3.1788515034890;
        Fri, 04 Sep 2026 02:43:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4709:b0:934:95d9:85fe with SMTP id af79cd13be357-939806ecf7fmr302183785a.3.1788515029655;
        Fri, 04 Sep 2026 02:43:49 -0700 (PDT)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm30554755e9.11.2026.09.04.02.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:43:48 -0700 (PDT)
Message-ID: <45e238e2-4c02-43c2-8050-cba0862f6be0@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:43:46 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260820-msm8952-pinctrl-v2-0-bf2b8b7b379b@mainlining.org>
 <20260820-msm8952-pinctrl-v2-2-bf2b8b7b379b@mainlining.org>
 <7eea6a82-6bcf-486d-9c0e-5a68c34c03de@oss.qualcomm.com>
 <1c059e1a-f791-4de9-87c2-cb13405b69bb@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1c059e1a-f791-4de9-87c2-cb13405b69bb@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: H1ogeGBgVNUOYGBKmieDG_hYih9OPCEC
X-Proofpoint-GUID: H1ogeGBgVNUOYGBKmieDG_hYih9OPCEC
X-Authority-Analysis: v=2.4 cv=Q5XiJY2a c=1 sm=1 tr=0 ts=6a9a92db cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=uepqBgb_qm6DIlqMricA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX0ZoDcfiWk6BE
 /I5vR/rJvZ1mANfqn4BMKjK0E3oSGSmuRabNyDJyoLALdnbLYmXv2eXRxy5/7w9B4sQjHwketKa
 4p6FNg1zXwQ4UIBTWsoQRvYlEQAM6tXpIczINpCxlgWrqJQqUESAqlUNoAi2ZRgFdxitMpAyL6K
 VdRVRj06x3FB2rG2GxOQj6EO63tTxOjeMc6Gnjjseevl6pKbyACbUG1dCRr3OH+0CJABK4uVldo
 8HDdn1RrxZJJxDfp5ZZFYcUAx6bV2cRGtIssW984D+2Uz301iQhJfUlbljPR/t1+djnlNPkWyRc
 h81+JwVNl+RpWkUyxj884ovQUnNOBb1XOvlk1SE0C4avTprPKWt71MDhy35jTJxCf9yWZleqOtK
 J5XODljkA35lT2g6gesNhGKJi+QaJVnexX65nCL0xAKvErbIR0tbOQTjCR/EA3nCLf4a1Bmw7W3
 am4L0Bm2cSfDeu9aGvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfXzU4NK6d72869
 04UJi0MUcw0Jq4DSBLieGOZ2tz37f/RE2DY31Kn3yt/3FXxsPg1lEaWB99ADXH4nqaWSctNXdYk
 ZvBfQR70sxRK65g5c6z0ektyyUFozKQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040088



On 02-Sep-26 18:11, Muzaffer Kadir wrote:
> Hi Konrad,

[...]

>>   must have a matching mipi_dsi0 entry in the GPIO0 PINGROUP() definition. The same consistency is required for every item in the table. The gpio function is intentionally excluded because it is inserted
>>   implicitly by the PINGROUP() macro.
> 
> Sibling SoCs like msm8917, msm8953 and
> msm8976 do leave them without any PINGROUP() too.
> I don't know what function index they map to
> and I don't want to cause bugs by wrong indexes.
> I don't know what to do with them.
> Should I remove them?

Apparently, for 8952, someone took their creative liberty
to rename function 0 (GPIO) into what looks like the
assignments on some internal devboard. All of these are
just GPIO functions (i.e. drop the other definitions,
they're totally bogus) except for:

  Function                GPIO group    Mux index
  ━━━━━━━━━━━━━━━━━━━━━━  ━━━━━━━━━━━━  ━━━━━━━━━━━
   qdss_cti_trig_out_b0         GPIO2           12
  ──────────────────────  ────────────  ───────────
   qdss_cti_trig_out_a1         GPIO3           11

Thanks for spotting this

Konrad
