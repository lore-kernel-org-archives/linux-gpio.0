Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.10.4.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794549970;
	b=KX9FPqAUupp/Oyop1e0JcimgGn3tjylncMtGVAiZhHzy5Si5l34d69Fv/jkT5FK2ur5L
	 ocS3nZE8MfmxohdkkbQ3JMwLxvVj+H7WNP1vRxpK5BZ0wS/D8xhG7bGSGuXgBlyUGRI4/
	 ICR5991CiMKmyedApFurSQrf/7a/yamHhGMz5XHr6OkasqA6AGw6Ee2Ub5AHh63c2mxWO
	 7Oa05Rsujy75X0pY5I6y4CJFtxblTh+cDJWNj4vnFFfZmmcJoeeojnDI9cXCL2Zhs3KjW
	 TQvOrY1dCTVp3DsgtGH7sTSVq+THIt6po+jYdHAVUId7iDxYPfe2Jq80DfTiWbZLlOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794549970;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy:X-TM-AS-Product-Ver:X-TM-AS-Result:
	 X-TMASE-MatchedRID:X-TM-AS-User-Approved-Sender:
	 X-TM-AS-User-Blocked-Sender:X-TMASE-Result:X-TMASE-Version:
	 X-TM-SNTS-SMTP;
	bh=flMc6FuWcJEoYIXLkF7OAV5DREmZKu32e8v9NGn7M9o=;
	b=gGlgSPyzePwCAVZTFO+9d5/Ux0IkZjVK3cdwNpO2/ClcXWboVDVS8T4snKXlAX4mqDAW
	 b5rf/vFwv4kbrHIT4FPMZ89KqnFPyIo6YgsA/+N3PLb1xeh6QcxOPzAGLRYkUMJWvI9Tk
	 wghd1GbDpGRMPs6bNdnwVOwnj0v4zr/HZ+GFMAlPBqVxBliISu1oClZ6XB32FqNvpJS6j
	 UB+8P5NNOlyGDl9U0hp7QI0Q5t/3GAnQI5v7Fg6VM5WwkVWCv6Yj2TU0BLNjcNU3TOgoP
	 RP2kZ9LJNFJD0cFqeHuXsyHsRo7WMmtiKoKw5D2z8WuIuY7igg2Euyvlcmh6TcBYYlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmedia.com.tw;
	spf=pass smtp.mailfrom=asmedia.com.tw;
	dkim=pass header.d=asmedia.com.tw header.i=@asmedia.com.tw header.a=rsa-sha256 header.s=asmediacomtw header.b=l7BOD+Qa;
	arc=none smtp.remote-ip=103.10.4.13
Received: from ms.asus.com (ms.asus.com [103.10.4.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A647606A31C;
	Fri, 13 Nov 2026 06:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A647606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=asmedia.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmedia.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=asmedia.com.tw header.i=@asmedia.com.tw header.a=rsa-sha256 header.s=asmediacomtw header.b=l7BOD+Qa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asmedia.com.tw; i=@asmedia.com.tw; q=dns/txt;
  s=asmediacomtw; t=1794549970; x=1826085970;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=flMc6FuWcJEoYIXLkF7OAV5DREmZKu32e8v9NGn7M9o=;
  b=l7BOD+Qa5xyOLO1wC83RdAfBAZao7wfUpvPoGNyLUoSYitzTvIAjRBwB
   L0q/kiIf45QQDV2/AYvMJNwgSkKh7dnqDJHwDrAhuVC/q+y2lYl6pXLMQ
   W+ydHmP/KPMciqkMha/TbkUJrw+hIrprsMrjNFFgdiLlOFFSSD5GYFtk3
   Q=;
X-CSE-ConnectionGUID: toLrWvyeQVqzppneDsA2+Q==
X-CSE-MsgGUID: KSpWdTozQFeByX+zxzPJ9A==
Received: from apza006tmd.corpnet.asus ([172.22.47.66])
  by ms.asus.com with ESMTP; 13 Nov 2026 14:06:02 +0800
Received: from mymail.asus.com (42.79.126.46) by APZA006TMD.corpnet.asus
 (172.22.47.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 13 Nov
 2026 14:06:00 +0800
From: Szuying Chen <Chloe_Chen@asmedia.com.tw>
To: <Markus.Elfring@web.de>, <linusw@kernel.org>,
	<linux-gpio@vger.kernel.org>, <brgl@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <Yd_Tseng@asmedia.com.tw>,
	<Jesse1_Chang@asmedia.com.tw>, <Richard_Hsu@asmedia.com.tw>, Szuying Chen
	<Chloe_Chen@asmedia.com.tw>
Subject: Re: Re: [PATCH v3] gpio: amdptpci: add support for AMD PT PCI controller
Date: Fri, 13 Nov 2026 14:05:36 +0800
Message-ID: <20261113060538.4105-1-Chloe_Chen@asmedia.com.tw>
X-Mailer: git-send-email 2.48.1
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: APZA003MDI.corpnet.asus (172.22.47.31) To
 APZA006TMD.corpnet.asus (172.22.47.66)
X-TM-AS-Product-Ver: SMEX-14.0.0.3239-9.1.2019-30316.004
X-TM-AS-Result: No-10--11.792200-8.000000
X-TMASE-MatchedRID: /zrVISaer8Ju4DGBDoAs85GPSO6O5JCagKzitR6I0vS4jV9yUdXXgZ0i
	AknL6Q/ZOoqFo6Nyyo5XHUOvAXclSmP0Ggjc6Q3cBZs/2FGsjFCIbFhMgnneR+NFKGiXDz16pR7
	uRPM/V2RXNTAoFR626JevLf+TF4u/cNIaCdesyLsarEv/I2gPytXNOAQ2MSi2D9tBl6aBswtIkE
	j2f2VroVo7GmCOJYd1+LH4VPpSV+tT0PyBnvNi7Sue369BGRwwiwAyD/hxCLy9BjdpmOpiF81Jy
	1PXqwqcoVo+XKPEcnGJ+hk79BwW7k6vshqw/l+H
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.792200-8.000000
X-TMASE-Version: SMEX-14.0.0.3239-9.1.2019-30316.004
X-TM-SNTS-SMTP:
	3C1D71A61776DA73EF965B4C3231CF4B0C76A68F3FFE5AECDC1319594E99E5052000:8

Hi Markus,

Thanks for the review and feedback.

>> This email and any attachments to it contain confidential information and are intended solely for the use of the individual to whom it
…

>I find such a signature inappropriate for a contribution in a public mailing list.

Agreed, sorry about that. I have asked our IT team to disable this disclaimer
for external emails, so it should be gone from v4 onward.

Best regards,
Szuying

