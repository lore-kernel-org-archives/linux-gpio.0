Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610323;
	b=evZSTGNZKwCYp9PvJaZmfuJh9sd567QZEXrIid1MieHKEIdzwfg6vYykpn/uuFLzYMAK
	 vz4tTwnMjU41ocsD+YTLEq6wGWuT7R/q780sYFOwj2gVgiyOK7Yd4qnqm1nyTYMTkQIOt
	 O5tCW4YkazkITEvJCoon8KqYMmvpT45meSS9756spzUOT5oldLfomPqA+Dgqc1lSi0mu2
	 a7Bh7BVwRePKG4++OeIZljT6c6lKbSbEJG6gcdop78fuAF1Ku4CNJAUm8J6fB2zWuXbY9
	 I/dHe3Rm8EfptvXu79kaSDPdXRMvvjms0/f2hJgxdm5LIAceRpRvsAN82ujb/h5B9jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610323;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UXOzgWLBPI0HSZWw5ePXFl3MWdfWtmydjnBYKW84RMg=;
	b=hADy4FadmYT5sIUZ1T9t5R+p8VnkT5KlmdQ6CK93qxP9jpiWSPmEbKfkje+ljO95fbYK
	 fo9wBni6XhnruFHaG3xaHULhU0AGd6ZHLb4LPoP3DfjIwWQJ5rR/LurrISTIQpRb322PM
	 yirLTW4HUz2oT3nj5wEEf1Esb9G6iuKZrDeO4ZlelzKcgQ7PQ3KS+9PwinAW8AICDHaiD
	 wl3XUntZ1BafXqtpQws/+CnX6n1bkWLiEZayfmC+zRk3skd3Zwg9fZbfakSNEU+g5Gh5w
	 BD6+MqiTLvvu//ZMHfHNvAeGy0CV3/02zUVP0p6UXrQeA9Vv2QgYBbnpGpCBRMMpN/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="b5HWdSW/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AZun7WvM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307D2606A33A
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 09:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 307D2606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b5HWdSW/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AZun7WvM
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vHRG3324618
	for <linux-gpio@vger.kernel.org>; Mon, 2 Nov 2026 09:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UXOzgWLBPI0HSZWw5ePXFl3MWdfWtmydjnBYKW84RMg=; b=b5HWdSW/zSgKoz1N
	L8Pr8e6B4Xo/4s69tTk1iuZlXzbgB67yQlMXYarygb7OvwZ64hxSc9IUVeSGWwVj
	SWQOltrTAc4Q6OvHAt/3ETz3HW2JXLt9DVCwbi+cBKsaCkeC43/ozqr6Dr6XqZoE
	yRaBW56IVOploExBc2nJFnUMSpskY9+CKKlug/xO96N8ha8Re3IkNX1b0dPir1Hv
	NDZnWvpOiG8eenpu+docwuW914w3MHx8IPckko0c/wUm8Tbldh8QvMY566H3nIRr
	3TygUgnclbyzO7dywYsgJAyKn7EDP2CHNBO1GIN2tbBU4ZskaFeZyZdJbn50QpSH
	n2tzJg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6p7s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 09:05:22 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc450e6dc2so2237227137.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 01:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610321; x=1794215121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UXOzgWLBPI0HSZWw5ePXFl3MWdfWtmydjnBYKW84RMg=;
        b=AZun7WvMi3jnGpyhMMt1R22R5BTKMCrsWMSiz0mNHGbl/0qCTSJJ28zg42g1HAA3/r
         9uqpnEIF5PpWkmdUAkwOa9bhnAoW7p4d2OIaHLgBciXbKo2fJT0GwrzQ1DqlkHCFvsQY
         dliQ6xfw5EEyoKmwPLpGajWsBl5gXqz3sE8O82xvRHVtZCvcytnLHu0C36qrArxeRJVn
         pWMef3BR9NgV0yJWzuKdjjGdo/+rMTRKNECroE4GW98IePxvkzNsqGHUZPDzQ0vM5AeM
         gNEoxxbaqLJn+Xx22xAVpDmtnG89fpBP063VDMx2CJsesgOQMHs73Y4C7xAk3YSya4yg
         1uwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610321; x=1794215121;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UXOzgWLBPI0HSZWw5ePXFl3MWdfWtmydjnBYKW84RMg=;
        b=ZvJ1ylZzgh9nJSS8feascJqi+/LdRzEBO3/vjeXfbasulkZrA9r289GB38TEO0hYOP
         0RP4M2SAj3qPkoYDCrOLf2aClgeWyupX8KApn03SMhDDEd81VQuK7wark26i25FGYAPe
         XZ8SH9vo3lMmpGiJwfOlZ4+bn3Z4w0x0CfvvzVSrFkc6G6N7eR1snuR2vgWdyLx721Vz
         TzttlwcNL+IPbUkJasD9Arwq3ViQ7Sub03P0iRnK8WpsFqE7mYK430PmacNwD8+cy2/s
         V3oBtdvKP3BTLcNV3nlOkuuPCYYPOG1kEdkw9JVreovJn7s46tef9C0NPSlOD4Rtq6LF
         QIOg==
X-Gm-Message-State: APuU4Z9Pg0hjWfnx//N5H7c9JYkJQq02AxeSxlYIzk9R43p1aW/o7H0W
	jxxm7vfPnYSYVmGkq/KbeLPKd4p6nz7DjHluCkSMtugZqBfH8kra62HF0SodqmDA2Ot8pPP4d+A
	8XVzkJHSr0xX3Ac5F9PUMYv9lpRxgB/KQ24hmRCRZ1UhK2bnzhbbln0SgIaNbdvo/
X-Gm-Gg: AYBFou28GvKhiMgQY9fLrSR4crqdNN258CTaemyPb9GmXZkEskRWN++kpB7ziC2E+Y5
	H+zszTJOcLMXrYu1gIAC1PH2UYstgYjKSnbhuQHko9WFYMcOuEDZBjoiKFxshrsw4AZaqO2HF6j
	mVyD7qS6z42Ekah1OsQmkh4e3WixhovzTbIw0BLABPnpNyHVBrNi+pguWaeOUsMqI1hcFxiNBj+
	G/5Ysyvmw3K0uwR2rTMRhBwHq4+ZzqxVFTqGHBOn91wPPHUn+87menhknhk2JNtkwMoroE8uyBi
	SFmT3g2ZnQ3weHZ7O38sUMQzBhKn3i3q8TCQYM8pBRCGtECN5VC6xlPVMzaM8o+K3bhmiqTht61
	GKw9dpodvy/eejYjrsf+w3+gulhXYkHWFxmK310qbxvokFqiHc/OCJLICN87Ncr9wZjSAiS8hEr
	5s
X-Received: by 2002:a05:6102:3706:b0:7bb:c382:2ff4 with SMTP id ada2fe7eead31-7d0726ca2femr3388974137.20.1793610321415;
        Mon, 02 Nov 2026 01:05:21 -0800 (PST)
X-Received: by 2002:a05:6102:3706:b0:7bb:c382:2ff4 with SMTP id ada2fe7eead31-7d0726ca2femr3388971137.20.1793610321039;
        Mon, 02 Nov 2026 01:05:21 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm17342081f8f.28.2026.11.02.01.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:05:20 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: sim: constify struct configfs_attribute
Date: Mon,  2 Nov 2026 10:05:13 +0100
Message-ID: <179361030998.39187.1516178621845255943.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020-gpio-sim-const-configfs-attrs-v2-1-ca4b79d2624d@oss.qualcomm.com>
References: <20261020-gpio-sim-const-configfs-attrs-v2-1-ca4b79d2624d@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: w0Z6TaLMvkjE77AIadI2gBz8b5KZJttD
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae85252 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=C7DGWjJ-WdxfBjvmcCAA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: w0Z6TaLMvkjE77AIadI2gBz8b5KZJttD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX2c0GHdaOFTfV
 RXmXJ34h/q2Q8z2mLlmF6M2z+50N7ZDcLS5RYP1p24uIAySd05kExD7VGehZmr+WZiJw0LQFHSi
 0kpxLhPSPNoiZojU1S8JuuLZoKw97HA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX96Fh2nE7LVCN
 qL3NIwmo+FtSUk0cAWrlht9WRakCAFhBx9HDbqMxqorGmrfxbJazf6L4Q1X8U0RjYvmECjA6M/u
 HyX/nI++DgqdvJ3C/iz6ddUo+tlBbUzO540+DyEgzg1+c4M/AiNgQdeTgFdNy4c7WIxX28au2v6
 P0ZMIIkN2AHq701pOOY6X3bcw6wrq2lqoYJVytWV2ZfNHW8ilxJZEEIDJkETY4sS3N8ahdZeXBG
 TH46th0c5Pfg2Dvk3ULUsgN3hgmpxl/bJjclDVbrWkdQpVg11q6I6vmalrFZYhy02INpbq6C8Sz
 ikyWRWqUELjBqUci0cjBdQB9f3JdFBKU/5s2Kh1WAeLeros4sjGVelhmLrRwysHUbusP5JgqaeA
 0ChvhamKWI+fBZntRp2lSXX4Ra2fm/mY6oRtJFvaHVKCCDoK6Mg8jXcBLJb+fOU6Zp0xaeqNC63
 LKmbydAOPTSNNwTLw5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036


On Tue, 20 Oct 2026 14:39:23 +0200, Bartosz Golaszewski wrote:
> In preparation for the constification of configfs attributes, make the
> existing instances of struct configfs_attribute in gpio-sim const and
> use the new st_attrs_const field of struct config_item_type.
> 
> 

Applied, thanks!

[1/1] gpio: sim: constify struct configfs_attribute
      https://git.kernel.org/brgl/c/b4e991a98844f240d1db005e65992c9246c9e7e3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
