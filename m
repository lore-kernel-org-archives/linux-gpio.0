Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217179;
	b=nijNmTdIoKiY2sjG7taiOiSCeEi8ibpvJPPVLEKsH6n1BI/hBafmdgfLwRQ24Ur26JZ7
	 FQAK6CeNOJWz5UBfANITxeiL8vy+Lr6fxhfiFjA5rY23It3zyNxRRnZBLu82yx1urekE6
	 DruLce2a4oEkbzNyHqiB+bWdF7KySgLuPdyqg9nb878+imXvyzhCZBKh2R43LyQyDTIkX
	 Br03Z5ly9FRl0l3azrwSM4NcV1TL0KdPn5HtbqMR2KoWe8OP9eE2tHifs01TgmO+TnG8O
	 SUsecZ+75f2/iskie4B2WLl0L8xVEquP/ghmZlpWmkoK6QUEvhrun2YZU0x2dTkQtFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k/MryLsTIN5kVKTH3Pbnv1AmufsI/5+jgtemRo4uues=;
	b=WjjwS9M2LUtRAoNU2B8sZF6V9l1ncF/8BRaNxASV2OOHFbYIlFK+sNryzVbpA5UCaHC3
	 nHCPY7mRjh2AUlrwEc/DpFuk7mz7G7k1Wn1xW3tHwDmXCQAJBZ7ZV98t8q5qT29F8y7+p
	 QlCeHf/n5y/IAqVmalq1pyG/8kbJp5F+fKOy64SQ3d2g1eyVgc7xBOYqAxWror9iHshs5
	 4RF+sadCPKwNpW41m8UoHzXdWRl87NEQ2BsHY5NJuv+o3gAb7nZ4qyb+VWNKXVnuymZ+3
	 KWZH6fCTXfsgmbUmM7D65JDBLHpJ1EeUsXklcMsTLSCVtQXmKCdqYehSPTzZyjRlaVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=acN6b9m9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SbUGFBXn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF44F606A31C
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 09:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF44F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=acN6b9m9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SbUGFBXn
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969wCM3611029
	for <linux-gpio@vger.kernel.org>; Mon, 9 Nov 2026 09:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/MryLsTIN5kVKTH3Pbnv1AmufsI/5+jgtemRo4uues=; b=acN6b9m9Ya7+MPom
	5ezGwy6+9ze2aJrO5B8mZ1gvoToC6REdvTsXHNQXQxsCQAaZVQyd6YRQy16NkrE0
	mjRx4KysVzyNtt4BanXHR8lhg6fTzUGFkxfJtDnWmcYTjoMKCihjKA88sQjy942z
	ZA2onwyIym/K8pWDPT26nd2hFgdVgsBm3n1oTRuyo69zpdwPriyt5v5U9B2NG6qz
	ZzKafRFG1gBC9AgSmZABpR9WZ9sIeqJbNLi2M9ydJk4E2EEfmIT1/mxLy7CXS6EG
	61fm838ukAIgtDHePiWh8aWKjibPzat5upPx6VnRnFCEFjHVkaYeE2VzvHNxsTSA
	eVQqQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnx4an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 09:39:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so140251585a.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 01:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794217177; x=1794821977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k/MryLsTIN5kVKTH3Pbnv1AmufsI/5+jgtemRo4uues=;
        b=SbUGFBXnYu4eL2rXFkAUf6rM0Ta8YMP5cAsdQAK/TxTlOsWWNlxGIPQzHGwrynr35G
         y6J+ly1neMyJXY7sH7fNztAHJyf4chJzf2avsnXO70B2lcJS7vh0rFjWAI9cw34WeGxg
         6PNkt5r4WTQ552qdHs+wIrv3IOmeMJVXgQcaU8PwFJ114vQ/3SOcPHoTanUW3PIkBUrm
         g2wAUcl4QtYD2R0AboE2V2lDIJtvo3X3za9BSvjgthmUEIqIemKrSqPviSxDDpt1CPOr
         AjuBUsUJaIoN6ZcI1cj1sFGDYOwz/A99QaTKIbrtqYI1qE1QHzIPff4xuIlH2EcARw8/
         kMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217177; x=1794821977;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/MryLsTIN5kVKTH3Pbnv1AmufsI/5+jgtemRo4uues=;
        b=VliJUJ7I3ebZtAlpDWnKsiYxBo3GTJqWjDZJ0S8eH72njtYCDMe0fi7rTvVOaDonnX
         qAr/OjmFQRmTaGRVQlFjZYfP8Cz+TJQppkIjBnGRPIce3TIYWb9bdPrdYxDLW5ftfBnY
         WzD2EZR9BR7A5JIoh6Y+uw19eM/3+nwHnaFE2Md4HXZIlIMInERNIjweYlBM5v3VDcrv
         4dRaHpNqeAHIot8NbozEltiOjVAWMfZODNykJUF8XYyUknj71tOC/dTRnICZeV11XogV
         NXegcgF58j3BC7n/Spe8md5nxtBrcQSKw1J6n+qdnjUbYDifl0lNcCVpBKJ6eL2O1gee
         Q0ZQ==
X-Forwarded-Encrypted: i=1; AL+hErG6kVygiBUUmPILsL1WhQ2Z4HRjm4mK/+vhH1aERG0q0ho6W+F607TCH5ntehH0PKICLu5pR2FMGmG4@vger.kernel.org
X-Gm-Message-State: APuU4Z+b7sKd12nLy12Z+RDv7OwMTZOhgnwaZs1HEp8ugb/g2Me1OMWT
	/vT1P1njyNYSrZywfqNa92A3FT3dUJm7/nUEc9BzmD5YocV1hlE6DTphpSLGosVVxd5E6IhxuzP
	Zi8O7l7ym1O4Z58DvVooFttsolR8F7orYVMVaj8xyw/T3yKndA6GoNxQDp4HhjmPF
X-Gm-Gg: AYBFou1WqOzDJzsesuf8SNHSBhu2CscA25TlHNbTFUES+4iAinRC6lYjxlz3lCjm0V1
	lj2CRgAfEe4tlJ/eXStG8N7Esj3hOtNxaRTu7/qsyfXzHyMg6H1w6pE0qFpDADoxuDSDN2TT2yG
	NculylsYlTWRneIBqEcBRrnx5YFnBQS15jSN7zhi8FFiF2hupeAPcalNz4pW9SXbAVuNOaj5myJ
	Rab5nK6Ol9q1vbXmYTLKV7m2xqQYrPUYU96Os2gpBdRheme3FvM9st8YamELsQx/ruVPmnWkApC
	4l4lJ6RX9NqTq+TBvr8EtNGumIZAksfU3niJeif69JWhfSNPetZwzq5JMPvYTnXZZxOTD9TilZw
	bsvJuWJS/yBka345U5DBYqSc/p4/Ovik2KyWmf+iujDHVWEHiH0QUWuUKRxWwO5Wgl7UF66lqVf
	TQOzOPkiuhS/tvoPcM7iHmrTE5r3WNnKE1q0vasJC2d2N6GoF6/rNulE9TR1Ihqw==
X-Received: by 2002:a05:620a:711a:b0:93e:623d:99ec with SMTP id af79cd13be357-947841e3a3bmr551108785a.13.1794217176916;
        Mon, 09 Nov 2026 01:39:36 -0800 (PST)
X-Received: by 2002:a05:620a:711a:b0:93e:623d:99ec with SMTP id af79cd13be357-947841e3a3bmr551106785a.13.1794217176494;
        Mon, 09 Nov 2026 01:39:36 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cb75913sm164965255e9.0.2026.11.09.01.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:39:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: fix a use-after-free bug in system shutdown path
Date: Mon,  9 Nov 2026 10:39:33 +0100
Message-ID: <179421717024.24538.4724609411487120777.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-pinctrl-qcom-uaf-v1-1-c9cbc0a93161@oss.qualcomm.com>
References: <20261105-pinctrl-qcom-uaf-v1-1-c9cbc0a93161@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LXS5CDSL82QhrsdudaESSqqul6btXEQk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzOCBTYWx0ZWRfX1pm1c/6G43/T
 ufOkO1bKjiavpUMtc+Pa23Sbz6cisUqNtDXUAY/UMk9YbquGmwP08JS8y7PUXSwXPbTdbnQ1gug
 tlejMM7wN0z8LJhuHfyb++mPzCS5oRXW23pEmwMKk+tLGbI8fG7S5R5sMZJg+u6DpLtDwUaNTnv
 jIs46aoYkvwZP0H8ne+dQkxNCsRD856r49rYfO7zpjL41twnkxhwM2CI/u6ZWExDTvBZmrWLc97
 e7gEBChVOMoH8WBvlBaG5zM7lYCStgpWKDYn/MgrKvdvoK0aO5P/pjNrsTCqX2bFDBxrWyE/nXZ
 KmGKWRs4CQT4Z8v0EOk8T34Hdpd53AhzLkwgfdapz4+eDXZm+zx6A2L0nsj/BlMbOAy+Nf6okRX
 SMSXfwSqrSPyZwKerzHvlGEV5ZBE5BpX4psGScz6HbuueJlNUh4HGwRQU07+6Esi4J4PgOug88l
 F6hacalkDZUWNm5cDTQ==
X-Proofpoint-ORIG-GUID: LXS5CDSL82QhrsdudaESSqqul6btXEQk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzOCBTYWx0ZWRfX3X5OhDOLBpBS
 hV4bDtlKbEMmJ1ESmG19v8EvC9y4CUNO5J3HEzjGxfX9RaRZH1itd9YSvP82b9jMDEOcrhlbuKW
 DFzQh0SdJz0DuFTHgxyELM9AbabXkC8=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af194d9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=L5XZeMja_UA31ktuEWAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090038


On Thu, 05 Nov 2026 17:09:40 +0100, Bartosz Golaszewski wrote:
> msm_pinctrl_probe() allocates the pctrl structure via devm_kzalloc() and
> unconditionally populates the global variables poweroff_pctrl and
> pm_power_off.
> 
> If msm_pinctrl_probe() subsequently fails, devres resources - including
> the memory allocated for pctrl - are automatically freed. However, the
> global pointers are never cleared, resulting in a use-after-free during
> kernel_power_off().
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: fix a use-after-free bug in system shutdown path
      https://git.kernel.org/brgl/c/6c940958950e5df52831fb8c78a045d426b09f1b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
