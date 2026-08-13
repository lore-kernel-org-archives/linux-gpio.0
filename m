Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8BB36A008
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609078; cv=none; b=eX1vzg4w1OzLDpfhhKweEhoFtTj37idDzzsUIIP50HPMEQDBAO3GS7B1jon4DcP3iPokIiL4dJr7Eulnns5+CV8aAGTYN8xybI0WRiDH35OaDRdoYmr4zxi7dhuuCo9aCq901UW5ZTrKIjEPkvQxPuPuBldcy5Ors8iUg9vlTrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609078; c=relaxed/simple;
	bh=O/5Hf8SddRsZSZonVNB+l5wPh7accPHDgr1w9rhThL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NC0jn277DSQZYOWhX8JWS6z4KId+XznXOIy7qGvENlyVBUonVLfc19Y/ti2Y7zLPj5wN5N9JX8c7wdhNlRrbGpTJOlmVu86EkUo9/c2XwfSVc2ayh3nNRZt+PFyQ7bK/HYYE/3wDS5yYKlpozm3CuZWcRljIQBQT62omXjnh9LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwbGYX/W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgtr481T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwbGYX/W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgtr481T"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5g8mg1072479
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=viBzwSlkDf4wVNFRuFOBrq+Ay6ECasXLpE6
	+ZGEJ4eg=; b=OwbGYX/WTgTOxrnHouE5fXobVOGv3Yg5yoECilFxg9PfKdFPo3y
	m8a1qwRAbkbkJDqDmzmoS3TW+hTAdSSfuA9VfFPytxMGKAg/Txf7sR54tBjEiidj
	c0adfCnySp5cQ+QXhEc52p4lVBbmyH6n/iGyakyLIq7QX3eo5z+jsuwtWKS+OerU
	ui305BCnivOLMzqilDCUpN6MWrCWnwjKXxV+tUxt2kATIwf4y4WvfFSTscFGT70X
	0rT+5nLq0M0QobysPlF0U90SUfrXqWreHvKHn8Q+bj2naD3jp2HCO3l/wb7Fcm0D
	X7rVOM8n8AlwlNomt5bH4tNF8p72dduk61Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g14syhapq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:17:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so84081285a.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 01:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786609075; x=1787213875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=viBzwSlkDf4wVNFRuFOBrq+Ay6ECasXLpE6+ZGEJ4eg=;
        b=fgtr481Tq0gKk2HGzaCOArQZ75M12aO8CwdIZ70sLX6b71gYTpprF5PP17evXFf5oR
         CKnnl7cBu948v4zuEqZdpW2RsYN23byIpzVo++N/HZ1KxypWc8tUPYf46YdEFW9KCUSn
         Bg7s16SS/8AzHbQ16pKcW/nqYsFrRRG1zb4jj1U5RFExg3dbx5w2dvCOZB+OjvkLkiMF
         BuHn1mUd9yObbKysr45wuQDXaBJ2szWGYFmdbyZsuhkjYPHs28Hqtq35h9VFOxeJfjDr
         HlCe2yyoY7OePaHAHMnQNwLHqXGqFtojSu85mkxkw9PlqDuDej9of/JrvQYIBshy5Sab
         YyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786609075; x=1787213875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=viBzwSlkDf4wVNFRuFOBrq+Ay6ECasXLpE6+ZGEJ4eg=;
        b=YMCwlLzWyQAzfK1zMeIGjWuFiuBj7usuBwF39peGNacJzjObL7Od5Si9bLv3+9jmUv
         ajV93/ZQGJOORav2TY2bE4F2hgfVPX6xxpmbXnskwMwoUaKBpGMF3M5sKzBhzKYp+mPQ
         9AzaU2wUPOXai/hlyf0n4D1jJuaIbtPTnKFbapxkq/jnM/2lNQrgN0YioQSFQ5y9KhE8
         xxKaPmdhNy8mpmlSz35Plk/K5Eem8/rYQ7w4Vlk8GzEXBlU6nyXNKPjA4yH9yU920Fa1
         IisWetoehRiYYhi11Fl+BlZYoI/p66ZPxTpq7hMkS6QsMuZqGHNRrZ4ty7A8KndtbD80
         rnsA==
X-Forwarded-Encrypted: i=1; AHgh+Rq60R6kFVU2EYg0/w9kimeq5ww9BMzQ2OF8TscsSnhQY9SRd6mV2E6WOM8rMcDf1kiUJKiKVCFiteBG@vger.kernel.org
X-Gm-Message-State: AOJu0YxdGNN1cJRYHdn8w3WIxRWkrzIlQ7FyBZj86e/+yrX7UVLCcEgM
	+gjZbOJw4A/qluCJQBzwkmvW16r2xQjZrxGY+SJlIb8Dej/O/N+nvs+PL3YZm7H+KCg/1IoHREY
	mymC5VyOn2AM6c67nC4KQED5SLe1ho1tIkR0OMTmsAxO6Mso9rI9XZsWddEw7DcvU
X-Gm-Gg: AR+sD12nyiciRzQdVvgh/F80kciEeVRBRnpBxinL5xQeHwCq8LVA6jUISpZYKIGy0se
	yJUjXISerzTiCkOXg3dR8fY5lYcLPdLDiVOWzVqNK35JhzjauAH8CvyLWdKpg5n5rxRfezAxIEZ
	BdOCS+xLg6bM/zPrua++6lQKK98EJ0/ckB23Gp4U6ATgdYTYtazsArhDAnEHTfdzjNmsZAB/l8s
	0VWE9d5a4S87f+UiD8PWwa3DjhIlDZwX9+y011SBiVwi7q0/3muQ14jaTBmjOXngQ3OkEmcPkvG
	hEl/SYl4lTfl0ju/awKtuck6f0DhbrG4UM2BFkJVK9+Q5Sq8U06jIo1W2MUdEbazmSoFIGjcmgz
	VHRUhnVrHRGxyzHy0Pa29VuiGeaLdkorldA0Gtw==
X-Received: by 2002:a05:622a:1a8f:b0:517:5add:e449 with SMTP id d75a77b69052e-52d73d5c0a5mr41463481cf.22.1786609075566;
        Thu, 13 Aug 2026 01:17:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8f:b0:517:5add:e449 with SMTP id d75a77b69052e-52d73d5c0a5mr41463121cf.22.1786609075161;
        Thu, 13 Aug 2026 01:17:55 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb1d:dc:7e00:4b5d:4abc:49d7:be98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981b1063esm56709845e9.6.2026.08.13.01.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:17:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.2
Date: Thu, 13 Aug 2026 10:17:48 +0200
Message-ID: <20260813081748.9285-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZcQt8MVA c=1 sm=1 tr=0 ts=6a7d7db4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=qusCvKRKjnJAVcoX-UsA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA1NyBTYWx0ZWRfX26HYjPJjfIHA
 BselA0Jyu2/KLO6X5EwnSx3mD1KjH5aR8Umip3X0Otf2MTmKeEYl2jRK9LoUWIzKQus/hAKNMBE
 9XDE1XfJ2bxYq+0/iWC9SX5H/4GJSvOA9ZYfAdrgDnbKAudizcTC7WCi5ZDCHstuRo6ciiSePZo
 /E0OE0KkFHQD3WW5YGqgSQpQ4Yz3qlxPEy0+X/hBfv7C3auWemQdYJ6ZZ8HLxHHj6GYKU82TgWm
 Dfapc/8IOOOOWdv/IlFf0w5nGzehDU82Q+AFqM3OdeLXMr4n5rLIJYWdUAwX4FTpoZbHyWqqZAs
 MVgkZzNIrq7x6U3fO3yMncsqeqyOvM+aTLaNyhc+a7ZuoAEiFsd7C6SI1rzT7KeSjkhjbJNOA7t
 2kUZ+mcQjKpvPrRfJkdnJd+LzDtDM4PuDaK38xiaI8Dr4/2W6enfDsX4Fda6pEOO1NSACQbYakc
 3y7tq2pO1FSVVpIg1MQ==
X-Proofpoint-ORIG-GUID: oLrlG6CjkxDzcUt2G_Wbxm5UmqaqxKot
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA1NyBTYWx0ZWRfX3tUM39X5GYWx
 1Bp41FuhjG8QhFZvwhgCIG9XdkgSWVZ1XoO+SA2cedo4tsYNr/RlWPRtGqMMUqEOqgvM+4ayMuq
 OKIDnWF/1Ch5kzfkt63z9kFr5yTqhHk=
X-Proofpoint-GUID: oLrlG6CjkxDzcUt2G_Wbxm5UmqaqxKot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130057

Linus,

Please pull the final set of GPIO fixes for this release.

Thanks,
Bartosz

The following changes since commit db2ddb87143519e20a95aa36c60b36107b736a58:

  Linux 7.2-rc7 (2026-08-09 14:54:50 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.2

for you to fetch changes up to 44f3468a0aef1aabdad551898ab7cfa2a9d20e99:

  gpio: sloppy-logic-analyzer: fix use-after-free via debugfs trigger on unbind (2026-08-10 12:49:04 +0200)

----------------------------------------------------------------
gpio fixes for v7.2

- use raw_spinlock_t in gpio-ml-ioh to avoid locking context issues
- fix a race condition in gpio-ml-ioh by sharing the register locks
  across channels
- fix a use-after-free bug in unbind path in gpio-sloppy-logic-analyzer

----------------------------------------------------------------
Bartosz Golaszewski (1):
      Merge tag 'v7.2-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-current

Cengiz Can (1):
      gpio: sloppy-logic-analyzer: fix use-after-free via debugfs trigger on unbind

Christophe Leroy (CS GROUP) (1):
      gpiolib: Check gc->get_direction() before calling gpiod_get_direction()

Junjie Cao (2):
      gpio: ml-ioh: use raw_spinlock_t for the register lock
      gpio: ml-ioh: share the register lock across channels

 drivers/gpio/gpio-ml-ioh.c                | 71 +++++++++++++++++--------------
 drivers/gpio/gpio-sloppy-logic-analyzer.c |  2 +-
 drivers/gpio/gpiolib.c                    |  3 +-
 3 files changed, 41 insertions(+), 35 deletions(-)
