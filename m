Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C853347F799
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 15:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277902; cv=none; b=mgioB3jiH454LkskaXNW228Z5jHVYwbO4WNZ+M3tg/E2QxIu7COnIfFrgTMdFeJBKx88GjFZXmi6ztCS2Ah8xSljo5fiJx0lSfmV5SJfVdHwKEtzq60vzA+eA3YIlUHgmUOv/LkSUO05SXsMX8vMUndnIJ9kjntL9HhSk6kY7AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277902; c=relaxed/simple;
	bh=09he5egQgLt2FlGKJ+y9h7K5tiRzxN1RtLaZYsMsDzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bbod0LSRqVllFe7GvhnZClsrK9kjDckIqkMlvC26T6pimqPMU0QrY/HhO+nOPi9wygKLKGnvUYlxWqGQ4V6A6RcuzQk1qdWQ0cl0Zz8CnAphN1tTXYlHodXUnTKJlRkMa1NU8lR18SzDHBHRND3hJgOQ8t4I0urp/hKQ3PCN+Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBsCKrdy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=THIAqL4e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBsCKrdy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="THIAqL4e"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8h6n3913862
	for <linux-gpio@vger.kernel.org>; Tue, 1 Sep 2026 15:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FLXuthiikXhHO9knkRoRDESDV7G87cacEj+L5hg3O0A=; b=IBsCKrdyIOT2jJh5
	uttyGrbXTRm0UCmq8i9eD1TKAU1WOeAsHrZscqk5dOqB3fXxquXSeTdKTwKnpo+c
	ICEEqQ5yzwMm4ab3upzVwNDLVLFBcZKO3TnCcDx4KmXpHaJpfBhOU7B14Okwktcr
	JvhD/g17TzXNO+2yj1hMttje604egG4iDsQPC5wnUTOL86oZdnTdpV9RGMxEPou5
	8PTTN2czqg8JbbyW5MnlryTm/FEsCFTARNjvzfEzlTbnBoWz2hHcWd8+J1N7IP8T
	OAgNMbDX/QMvYo6UCWe+6gg6QnpKL6Q8YQMXJh0WEZbL06dhQZ8lcr9j50PmL7dU
	jhzj1Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu2ghm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 15:51:39 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-784f9401a7dso3728137.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 08:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277899; x=1788882699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FLXuthiikXhHO9knkRoRDESDV7G87cacEj+L5hg3O0A=;
        b=THIAqL4eFv+ZgSIXoppF/WEkA9RdTJtMeYkxnBIiV48whQ6qVXnOhaInOG2pZC0kZ9
         l9EurRaq1qAvBUViAnz3IiKM4jD/fmuFDXhuN3AAaoLdRTTOs4F6Nsv4DYQ9uQ22N+Tx
         pnPIf2flv/AYzEEFAwDSmjpwKOMpatS+7/8b2fkuFKAPwjSWKC9s7pMUISsvkomcIzQw
         AVPD/c9N6HRdpGcFYiQJjSmeMCAKqMWtSCBGEQp8/ZxJowZGsbUPgLcqWIUdpZqX2Q6C
         ZjDPo9w6Vi5GfiCZzKnbkhmXo5yemnv1nMnuEpN7FPBeTxsDyfknXrHF5e9F2gNMtSFR
         5WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277899; x=1788882699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FLXuthiikXhHO9knkRoRDESDV7G87cacEj+L5hg3O0A=;
        b=Y4StoPnl2P11fRTFj4sKAStFJWJULPV4I0UjJkGxmPOnrrW1RmGaYQaA2/iYTsOgTV
         bywxNYemq71aMTJ0rYi+VyS4l5uy4wWSveymVLMgICcsV16wl4XdVDGRmoi5doAayuKc
         LVTE+degfH2Q92SLvMlI9+9Qr5Uto6y2oJi6sJikWWyTqS+Jvpt5xqqYxZcYt1YP6wNv
         rcp4feSOw93FMYrZ9dTobYNrQmHDEqGcYIGM3FWnbLD/mj5MeQ1TOhwqd80uXbTaHtCX
         32nljWJjfcLynRG7+r1i549vIRUn6iv7tgkgMGTz9KCZQrrI2Ja7uyJS+oB5xfkw1h6r
         E3bw==
X-Forwarded-Encrypted: i=1; AHgh+RoibWvT/OlL8brQGdpIn6mevLkoX4SIRa9m9V9LmqMZ52E1WfAMqOyvhRPt5YGfRWc6rL/qxdeMnluj@vger.kernel.org
X-Gm-Message-State: AFuF++mOUmBjglKxeOMBosiSx0OXjxsmuIP29dTdR0QerAw0M9YiEHKq
	kdV/s8TFqOVTF8o72w5w78zw9c58diKn7clvIZGZwcokgEEvvBmmXo1SBEhi6yxmTp1KjYIllSm
	liSwZGinPui4xzgVPU0X7RSBHq2kNsjtJeX8zdEKoy2b8+OD6ptP7jmMxI1aZDjZv
X-Gm-Gg: AR+sD10wHjvclGplwYkJBOAzGVZqkRfSJG7b8yPmYwcizfCf0rjmYqDqsQHrQevA3eD
	fy8tTdEz2DhivVXWWBqYIpqYyAa7Ad46ZdRAQ07gcBmJnNsewMkllAEZm07shUg+VMJjuL9nrTO
	FLrhjY2JX8stgToeKZ30oPC6h7GUmrW/ExQ7S/sxm/MenRNSHYv3tQvyyvL8VUvY+dWOpw8CLq7
	/Z16kewtjX/LXNgg5QYHMlM0OWnDR0Mi3EBIei0ZkEGR2qAkasbaZ6KbwCdZnUc0Q3VwnFgB4Ea
	UHEGc9x8CopxaZOcLKlPj11tuL1pcgD4ve+lPKoEC6s+TOIvIJXP0PmYl5X5+HEQ2kCl3IZkhHH
	JE5UXO9yUtWfe3OIqvq0wbA==
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4728007137.0.1788277898945;
        Tue, 01 Sep 2026 08:51:38 -0700 (PDT)
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4727991137.0.1788277898479;
        Tue, 01 Sep 2026 08:51:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b1fdasm630555566b.37.2026.09.01.08.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 08:51:37 -0700 (PDT)
Message-ID: <e7fd5417-19f9-4bbd-ad65-48230fb81c05@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:51:34 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-9-6d47636a8f09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-9-6d47636a8f09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfXzEnSBrV4vpQg
 E5dYqmPQmdBCHwbLyFRj2uqtV/H+1Ca2VwhFQ8/iBW8fI9SDmii6sOSoHr0ArR37Ya2PvI4D+IM
 dtN5Bkh8JHa0oQFCoYgSiqtt/cdHjLV6rFH1J4S1nocw9HWsicJdic+lrx9Ak67okyUeBj1+QfR
 tV1aFRuljP0BzGrmGXq677IOd9DUnxCAyYsc7rlqspU6WkIRK8pu9T9xfTorOqM+xWAT6/X+9fI
 jVTkICmcjOHi1Wjl6FREiRlaIi1UD/aZT63ffYQZiHCmFDlC3ZoguIiJxAJ0gWYAQyiB6rn3ESg
 SMOym4Cqf+9hQKc6gLpUszk9rPowrkJABhG1V4q5T1otJF9k7FwRDGMiPiWZYjZcsjD/LRsh+UY
 Au/emqGRS3Q6VgeTR7eLjUSQpw6hTnhI3siHyfl1UvxBrGK3Hnpe2Jcdk/Rk6wQ3oTHSWm7Jvvo
 B6hzukf7LOYIgIUsMDg==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96f48b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4tAzDn1lkwtfZF03VZIA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfXy+zFV1Ry7gFK
 i86O480XaigVgWXCXOqHI9quYZlqFI93ckRFEnijl2DB8cVbgul2T7qLhxalcNNukTndkhNcj3y
 uIwyMiGO8Sr5vObwre8f46CGy5CdP1k=
X-Proofpoint-ORIG-GUID: xT2bTNCioyakcXuuMuLqJmS_biIYE54F
X-Proofpoint-GUID: xT2bTNCioyakcXuuMuLqJmS_biIYE54F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010140

On 8/27/26 7:51 PM, Hardeep Sharma wrote:
> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
> interface through the common pinctrl-msm driver.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
