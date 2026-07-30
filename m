Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DA736F414
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 07:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785397838; cv=none; b=qztsN56MmjpJquYI/5pPp0UJi9FA2NodR48KaLc+ZSe0byHeGsbc/n6wKrp5T1m7y4lBP4ouJqrLZ92Cyag4jEzW1nrkjy7dSlABDAkw7/0WHQ6sChaw+rynI6bEbxkuxGC+/O3iRocWWs1QzNDiLdy4apP4y9xwn5GuIXd5pTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785397838; c=relaxed/simple;
	bh=1WAzoaaCAo6cj6uJuPgS6QKBgvxSmnWCYTM1la5NyG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bIg5fp96DhnRCydDgOaXbeOFl40EagKRmc0X7GW0krNpfefpAXrJsW04fudta7fZyvYy5b4AHVEQf2riavSAcHAeyjNZi85Ma0NDpItgTASt/p+ko4S4UkKI8ImEXU0N/UmejjQ0CaMxFL0AjhRt/bC8hlBHZQ9k5/csVjT0mdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eb1Om9Jx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kxb+uz30; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eb1Om9Jx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kxb+uz30"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U6fw6k217054
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 07:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oOI8N2IzZLt8muTQy9Xe3yIFX+yhwcPZKza
	298upmtQ=; b=eb1Om9JxE29YXd8vuK2liz0JYuaUC6QVlRATY2LiDBXOuINAXLC
	vbfFM7uEtxY8mDZ6CFG9lSxi74awvicuC+y8abs9Sot6j/cjPERGVw1R3oLxmddJ
	4dXLd3sVULxwKjB++DzqFrmE4xwAm8Y9rIXVuxAs3W3UYqFFAYPd+RPEyfO6AAEp
	ithTv+QlPxFkPvuXqniTHQ17CGQJrGKGH7baL0Gm968bnBtktxUrwcUyCmGxO17K
	bhBA9KyCGbGKRCtMtFZ6WT9B8b5NV4jjmE/tNMVtXjFlBO5WSXK50KgEsIv5d3s1
	g6NpvFVcFHq327IwAWsnQeY8a//m5XdCa+Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr1jvr9qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 07:50:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1eb52e1fso34807441cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 00:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785397830; x=1786002630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oOI8N2IzZLt8muTQy9Xe3yIFX+yhwcPZKza298upmtQ=;
        b=Kxb+uz30j9sx/p84Ro1dPyeCyv/8jgFGPF0wq4B1Dy/lTOsQicQ/MJWldMNX9PgkT2
         JJMZcWEPJzfY3DwM3C7YhuD4rTlDB6SbAZ6MlfPvTxGjtq0tBZ/xa02jWLcuRdkCCexm
         6XnSyLCwQBGTE5ERsRr63ouAbv/6X4tsekRok5zzlJItJGCcLPDr9w1MBmlXs6tisWG6
         GrRavnW9GjZoA/UHftEmj/hdHO/2STul4X06dwcjuXU6B/eG1jo1gMAshuYciMsdTpMi
         +B1Oo9RXQOEEmFxYlELbfldaN2F4NIXLc8slZmd3zyDCscDK5Z+FnvVGE7lUwDSD94Pa
         mw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785397830; x=1786002630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOI8N2IzZLt8muTQy9Xe3yIFX+yhwcPZKza298upmtQ=;
        b=mUG8ujFo+dzflsF627TDhaL17oyGojQOeHhv36xUUqBH3hBj6zYpPJep7vtKRfM0or
         FSWUzcTfSk2SHseUDxZvKYw/DXEtQ9M4TxwSD9HbZau7Djsc7q01hqvSGlpB+mXNXSJ0
         yvZex/NUjs4FjITV3SCbxdxQ2vNrB1icxZAnyGI6K2fjBrN2imb/o+AF6Znu3/yj91NE
         uj/JyZ0Ft4gj8vvQi+z8cyB/hHUdw/X471NS6a7aELingB8yNRRV4HtSOuzq7LZ32mK1
         4sCfEP7A8klknCOQAi1+vrTWlBeGEDnCJAGbJOlZqSU3GxltXsXk3GMdkVVLpglq/aTA
         22/g==
X-Forwarded-Encrypted: i=1; AHgh+RqC3bCQriyS0pWe6i/p19CA+0QlqiAhEhqmWofSkfMkBE3VfvqlhTaV8K7EdTKMwJQeoXgpb7eh53yK@vger.kernel.org
X-Gm-Message-State: AOJu0YwNSnnaDVBeqTCNKnaddSoQzGI+wPG6wewLvAQYZkIaDRv1weN6
	Fn0FfqlnKZNJCKKZM/WFwlFf+MZw37pt6EX2yzcUVFPDE2s+tKSrsIa4RWwtRbfpqBL6zljgZZQ
	YqZGSQn8kw9Y3m1kOSf44bztnOwq4GG0gSpifFcd1GuQzt5w1B7mTb3n0hP02bKsU
X-Gm-Gg: AR+sD1039GRMFDW3q2JVqBIri+1Mbi/yaOp6rvVMuc97p/kVa9vmXSaM1tZhwKKG3Q2
	tOKDf/USpJaNL8Ug97GiN4xtJ6NCIbGTXb6rkNu/jH5P2qXdm1h1MXLtjWM+iPdXQ8wd46VzVaY
	oRapdd08SkS4G3WPgT4l9NMj0hvOVcTPGT+pcNd81TPD/w8xwrdI/lrDfsofJhr5BdHRBYa13yf
	507tnZ8yN5iqDlpxgWtOU+/FsbaETj9MBlLReZQ6maz4owRB408/ZWudKxl2h4XbNX7jzNmc0AP
	f6hGwiO8U4oWiQfr/DlaB+PXSfebzVEXg2RcRJVuv611IOpZS5oZNqqAiKxAKKUee9e9q6Zn2Qp
	l2jpZBgV3v5XTc1f7BKqT88FJEkQl
X-Received: by 2002:a05:622a:164b:b0:51a:8c86:bd42 with SMTP id d75a77b69052e-52b386aa275mr15455601cf.63.1785397829999;
        Thu, 30 Jul 2026 00:50:29 -0700 (PDT)
X-Received: by 2002:a05:622a:164b:b0:51a:8c86:bd42 with SMTP id d75a77b69052e-52b386aa275mr15455451cf.63.1785397829535;
        Thu, 30 Jul 2026 00:50:29 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:529e:6fba:4bc2:e378])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49764d6d0f8sm111646775e9.2.2026.07.30.00.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 00:50:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.2-rc6
Date: Thu, 30 Jul 2026 09:50:24 +0200
Message-ID: <20260730075024.7320-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1NSBTYWx0ZWRfXx+G7Ct6Q7GMl
 Bml+bA76OAjfdVPwdRZdAahVudcJDAmYzJYFdbD03RuueJ4wIG5LR4YOFk2reOaL2Vf1f3WX3cs
 Eh5OYMYWl4VHyBsAgh99k4Y4/B5L6vcWDcP0CIkXEfCjlyfX50ExhQVI20yMK0xjcX6452KRoc3
 NtJ1IWl/EK6llvMtuGgPh+fv7rvhdQlJDxYINM7k1XkuoSDAZ2wmuy6iXcyxAPUtr1Mgo+dQiZ9
 UOEM7w9cxqulz+77ai9XXaSe2JhEyZDzvCswtxSvO4nN+pOivC7HMvAdI/BGXodZNxgYqJfGsRy
 jtSuHDBuxpvTrnJNuRWTpGjBXoNZhFEAZVlo0nkPjhxkxKu2Noa9UNl+eXVvyUnFx3BeKsMdwZF
 SVWhM01FemkY6Oo4jE3C/yaEpINzjS2UbmcRF7IMZQanJpohdgITmqdMfJ2VI12rfxOemK7n/rd
 0vO4HRfmuwvjF61fKNg==
X-Proofpoint-GUID: _TIXho6eorcEsB3JcGhzH_WuIx9rO04O
X-Proofpoint-ORIG-GUID: _TIXho6eorcEsB3JcGhzH_WuIx9rO04O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1NSBTYWx0ZWRfX4WoLvFDhK3vp
 4fsZmvYO2D5ob60GHXolPy7eVvvWrLHmCEjdcs0KqD/i+OAIKivPHmIGRYQ3G28UGj73EQAeTIe
 88IVes+UutbBzPeviDnuFtw1O806KaM=
X-Authority-Analysis: v=2.4 cv=aN/Ab79m c=1 sm=1 tr=0 ts=6a6b024b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=LKkrQhEXttJtp-Se6hYA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300055

Linus,

Please pull the following set of GPIO fixes for the next RC.

Thanks,
Bartosz

The following changes since commit a13c140cc289c0b7b3770bce5b3ad42ab35074aa:

  Linux 7.2-rc3 (2026-07-12 14:16:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.2-rc6

for you to fetch changes up to a02b8950d619123da64f69b70fe1dadef217dfe4:

  gpio: pch: use raw_spinlock_t for the register lock (2026-07-27 15:07:51 +0200)

----------------------------------------------------------------
gpio fixes for v7.2-rc6

- fix a memory leak in gpio-sloppy-logic-analyzer
- fix a regression in GPIO hog handling for hogs without direction
  specified
- extend the critical section in IRQ handling in gpio-pca953x to cover
  the reads from the direction register
- disable the interrupt on errors when restoring context in gpio-pca953x
- apply the initial value when setting direction in gpio-by-pinctrl
- use raw spinlock for the register lock in gpio-pch to address locking
  context issues

----------------------------------------------------------------
Abdun Nihaal (1):
      gpio: sloppy-logic-analyzer: Fix memory leak in gpio_la_poll_probe()

Alex Tran (1):
      gpio: gpio-by-pinctrl: Apply initial value in direction output wrapper

Daniel Golle (1):
      gpiolib: tolerate gpio-hogs lacking a hogging state

Junjie Cao (1):
      gpio: pch: use raw_spinlock_t for the register lock

Mark Tomlinson (1):
      gpio: pca953x: fix pca953x_irq_bus_sync_unlock regmap lock

bui duc phuc (1):
      gpio: pca953x: fix cache_only and IRQ state on restore_context() failure

 drivers/gpio/gpio-by-pinctrl.c            | 18 ++++++++++------
 drivers/gpio/gpio-pca953x.c               | 34 ++++++++++++++++++++++++-------
 drivers/gpio/gpio-pch.c                   | 28 ++++++++++++-------------
 drivers/gpio/gpio-sloppy-logic-analyzer.c | 10 +++++++++
 drivers/gpio/gpiolib.c                    | 13 +++++++-----
 5 files changed, 71 insertions(+), 32 deletions(-)
