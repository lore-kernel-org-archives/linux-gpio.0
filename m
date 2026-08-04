Received: from rusty.tulip.relay.mailchannels.net (rusty.tulip.relay.mailchannels.net [23.83.218.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27A43E9C16;
	Tue,  4 Aug 2026 14:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.218.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853528; cv=none; b=bLSm5oRuA/CoASB+r2w4nNeoPE/E9Z5EnpDQZ3+gAdduvwjJL8JPGd3vwlbpioTnmW37kHOUF7iFA7FkhiwgLYhjpCb/F7cM1KreW449+E1pe5Xe6P9uvPCnGDJA+FXercyLnfC207SkFkdL/s1/Xhbd/kqjnkL0ZiJYmFaySkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853528; c=relaxed/simple;
	bh=ctCtmWffUD8JKJGWtgLHm8Bl2ZGh8zN8rkiL2guT5ZM=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=EBsoBQ6h2bvYVnT+8SF+9aOBx8rPEUuHcoHti4KBAspapn9ugWkTqqmJCzdVfV7JlR0QHtdYJ/gpVg/XbyPRPgYvMJ8VFYzU21O9b07QFVw6RDMxawbRHdt6qjc3rPeRW1FuXKsUyvesx3ax3mXNCwKGYc0gFO9waw9hY0az2nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=Fb24aMBq; arc=none smtp.client-ip=23.83.218.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="Fb24aMBq"
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 8C78D802A42;
	Tue, 04 Aug 2026 14:24:56 +0000 (UTC)
Received: from fr-int-smtpout18.hostinger.io (100-111-241-60.trex-nlb.outbound.svc.cluster.local [100.111.241.60])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 42CDA80274F;
	Tue, 04 Aug 2026 14:24:51 +0000 (UTC)
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Celery-Hook: 6e5f91ee2dc7ef85_1785853495174_255492421
X-MC-Loop-Signature: 1785853495174:838635090
X-MC-Ingress-Time: 1785853495173
Received: from fr-int-smtpout18.hostinger.io (fr-int-smtpout18.hostinger.io
 [148.222.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.111.241.60 (trex/8.0.2);
	Tue, 04 Aug 2026 14:24:55 +0000
Received: from [IPV6:2404:c0:b203:a6a7:55d9:cde7:2d4f:c58d] (unknown [IPv6:2404:c0:b203:a6a7:55d9:cde7:2d4f:c58d])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4hDwly6wtQz1xxd;
	Tue,  4 Aug 2026 14:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1785853489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9v+HbTzWBfh1Gmf/fk8WRVhO2s6dDvNdLs+LNUAiZ+U=;
	b=Fb24aMBqZhBji2+gyywXVphlyDdaKJ2LrNxnqwsKJZ4szLWhT0GYNP9BL8L00Zqh3A24rD
	gPDmY5IJUtoQdSEzQmyH354Fm6nmqYdSg3vn9mARYGPJCqJW5SL5uPk/3TazgJoT4jb4+F
	gD0PEUtmsCBsmkk/DqX8WQLgWE9WqlAW+Day1Jsv8dQQpY0OSypMq+M/jNkLqFukCdZYDd
	gGT1PJRkipgx9PDh8wNfhHxOt2z6VI6lDabIg41o/cN/6MddaFnpsNz865iCs3UUreYSGc
	8nGlbHq008EXUr78yrrMiy75QYUzSTWoCnmjWAGSZSPFfLFOvVhq1Yj7c5EZ5w==
Message-ID: <ddc7820d-a9c8-4a69-9df2-6bc4ff61d3ee@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] ARM: dts: qcom: apq8064: Fix USB controller clocks
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Guru Das Srinagesh
 <linux@gurudas.dev>, Linus Walleij <linusw@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260804-mainline-send-v1-sending-v5-0-149dd4372ac8@alex-min.fr>
 <20260804-mainline-send-v1-sending-v5-3-149dd4372ac8@alex-min.fr>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <20260804-mainline-send-v1-sending-v5-3-149dd4372ac8@alex-min.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue,  4 Aug 2026 14:24:30 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Gq4Q+V1C c=1 sm=1 tr=0 ts=6a71f631 a=qOstXJigc3fKijKOYFRv+w==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=accKExrkbF7l0cSrD3IA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfE5ajB1JLe7ezsWryTj5qvDzd4QHZzk3f5Rb0lKfA/jBmdRgYWa1BL92L3UfCfKEwnJl0hoI2CLlCMb6g9Jq670GZ+/n/994fWHzCMJPXz1y0Ym5vdSz mgUNz6p+x9iu93tjBOeNdBkXEWFGzQbSTagzU1LOjpgzU00WCRFP2QY3G/JilT3NPQueiSF73npLZRRGu1T7En2TxKSUOMRi9vQJUnHWPWb0rpZxAt0hd+G4 4wdDZzgzqzXCTq0kjHGbv5BFb4sldnhyTuJbT/G8WZTwhTEP8K6rhV4A5b4nhpN6eao3wNgrcmkunklG+qBFS/P5y+bEBzovUFw0dlNWET8vTMzkPqfcjAgg YNXJp1k7tbfoeOrNAEk5oXsgH53ejwhGQYQn0IFFyMHfVmldvbwGBBUIYb7xHzar7GiFo4vWgaJ2Aj0FXDWHtzCcSOGJfxoZtt2CEo6JwZ9Z6ID0MUDqouTN QqQN8BEPA3909wvYPbQVv+PlvY3X9WNuBcuWDKnJp80QBj5HIaQQE5ZF8ixlpcveWn04dxmvBavFCSLbZ/AFCps+WOQctkgkRlzSI/8J3mu6WV1X4TH3Wlv0 azEFsy1wbMIkwDohBMpg+SRA7JFM5ZgTlXpGaSBhiQCQPqhI/QpH0q47xir+AbYrFQIwFo3rzINQM9dDvxAhz9HVsqOjpbXQmjXQXpI0tIp1PkG0SoWnV2xc NhyWm9ku5aOaeoUm8SomvwgCt1/aIdOPoIexd7ZNclFPKjcdi1uTPWy2pfQMnr1Le2L2VfmVm4knUY0bioyLPueZbFQyRFp++CZx+ksiIPiJcnoMUemcQuAQ /wOLKW+MFyaMRWzWbQLE+ka/kd1Vj46jet8YcBl1sqIVM8VnlPt7rPAYj05CYa+koybkCtmX4C8Cxmj70f1BzIRAauu/t5ClLSRU6Cy8nrjTBWx/I7HZaEm+ Ipqq/HWKCk5Eimg
 vn8noAlnIoSm4HxMrDEIBU1RQZ6H+qJ3/0vXi4WSw/bWjFbmP3z8aIg==
X-AuthUser: linux@smankusors.com

On 8/4/2026 1:34 PM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> The APQ8064 HS USB controller nodes describe the transceiver clock as
> "core", but the ChipIdea MSM glue expects "core" to be the controller
> fabric clock and "fs" to be the transceiver clock.
> 
> This mismatch can leave the fabric clock disabled while the controller is
> accessed. Some boards may tolerate that if the clock is already enabled
> elsewhere, but it is not a correct description of the hardware.
> 
> Describe the RPM Daytona fabric clock as "core", the AHB clock as
> "iface", and the transceiver clock as "fs" for all APQ8064 HS USB
> controllers. Without this, USB does not probe reliably on Samsung Galaxy
> S4 because the fabric clock remains disabled.

oh sorry, I forgot to mention that, depending on the feedback on
msm8960's patch [1], we might end up swapping the Daytona fabric and
HS1_H clocks. So, Daytona fabric would be the "iface" and HS1_H would be
the "core".

[1] 
https://lore.kernel.org/all/1416ada5-ccdf-400e-b2b8-d2c5c7e335dc@oss.qualcomm.com/

-- 
Thanks,
Antony K. S.
