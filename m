Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293343B42CD
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140122; cv=none; b=t+su0pwVAirLWJCk0OYDBuAy2AFebnlDQBqWF6vxG3VDHaxBhU3T9uTwrxzAwB9Robi7015bUcCCxU9es/kMXjzSWiTZJ9t/ZZoDIWcu0hbVKFCPLDKgOJzTbkErVO+xk9UxGdHlept+vmnmOyfcYCY7WkxFoBy+PRK5kUuaWHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140122; c=relaxed/simple;
	bh=f35hvVF7i0AhAl5XBNbt5JyELF/E6DPKGTAChcrUV18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gnl6WsQNdTtHPe5yyXPFl//RXidCEgjhkiWC4vF5s+7By7U+XfhnrxqosY+vxJan9Tm2RevQm/HPzG1r/yMgfWeZ0+INeafPirwqK10JR4Q+WErjOINtM4UmsqJYGVmI+B9qL0QrxqK7WR2lKcP0mpR9jvFWut7CdQy0LeaPpbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4mwTtye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQZqxBmi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4mwTtye";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQZqxBmi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G7ii0O1890683
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 08:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pjF6bo+9BdkiXpKV2UrWU2z2lv2vcOexCov
	G0fmugZg=; b=k4mwTtyeOEW4FfY0cRnHR/5kPFZVMWU6oKB337mlyON9d0ODXNL
	evTuA00jV+qtjcbbgzraLoBsq/xBhQlVY1qZT+vcG86BXiwoDBK4N6Elo7R6vu8A
	bWPXYW72vnxh61j/6pccV15dDhrrUnNyTAWuxvYD/yc1Reqt1+B3jzX2Qw9asEmU
	jY45EAQUIOK0jUeGMpApi2yij/1BrhsCbcHdA5rzKnREowTb4YojYOYl6sO9E4zH
	vc8sSMhNVpbTrQTu6RBcTL+qe5Ku0oXGh8RCafqzakK6ILKxNAOpnbHyPOIfN4PS
	h3Ejqlfhh5TPecQ8TBgpYwEXKXZbWFlq6kA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba261f40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 08:42:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917baea8e5dso111622456d6.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 01:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140119; x=1792744919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjF6bo+9BdkiXpKV2UrWU2z2lv2vcOexCovG0fmugZg=;
        b=LQZqxBmiNVYzasy/FNDXRbtuNjOBe6cfDzoBAadiiCj5SYazl2dXCt+6fII2LEcqKP
         ylIqAGv2qbv0vzjACewvyfNgDmPXiB4bj6Pe8L1ui1zJYyrIF7YdmmVzDOIL3xV+v0cb
         HuYWep5C5OgAo+WwudJ0gUm24R7ktgmKSqRfiKamO5pN2XxVKD+uF+bbUlVrDtMhrnOr
         7DGawYrjbp0saacqqO6jkrny6/xx8B3pCpO/aFlMJeYx8paLxb3G+Eej87B1QGFPjZAC
         3UUNC/FXAcEi6sROjNH7beLJDGgIViqFOR95bruXi8vhLPqCQ2Vr0pJgtdnIZ+xLPKUj
         tHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140119; x=1792744919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjF6bo+9BdkiXpKV2UrWU2z2lv2vcOexCovG0fmugZg=;
        b=Bo4s7prfVYgszpNxxsXMGHR1YSwHPkb3wfDV1O8gh+6nxenmQs2vvFsT8Ov5eRBel5
         NvcT8G1e5GQrTgCMirqKjPvhZ+cG3QnRgjP2sYnPeaRpGkYzfX3TE2tB5U+48KzCuDeC
         TvGeCR3LlVuwlBBekZBdM7CAcaSjbCaYMxAK52o5agZz7hg2ZNn3H90mjElw7eVskGM1
         zUw9RQlmZ4rUqMJPfS3Rj/oYFCsvuBC13xk9SX5j4J//0X+RfMkogL0XU5mf3hWkSLsY
         7RvYgsulvH0Eeel2f3ouIpp81mNP30JC3OmNUj9620bOGNJSPebqyT4N4NUnt3bIs1gz
         2KGg==
X-Forwarded-Encrypted: i=1; AKwUvBzhKg80PhVy15mlW/69BPD3csPc2JgiLy+a4PTbddEEi0uyUvU1PzutpfmFgcMYtKmGrnsN2Y6g8ijh@vger.kernel.org
X-Gm-Message-State: AFq9FYKew15TLY09wccRvvZLBpKdEWPp8rvo+xzl1Hkn+jLZ80pxEw1I
	iAW+4q6dF03tYXaLxbE+KpqbZbu+m+oOrLKDFgmbbnd5GzJZQAQZxPgYNfRNS/6jpdpv/YijBoD
	9E9neGTpz/DqoI+dD+cfMF381odZy5awIkeRJnAh0wdt3IhfR1YTGfrdhrCQukjCB0LS1FeIi
X-Gm-Gg: AYBFou0WTyxpFDBKkWeVTsko5zG9ljwGC/aMQFdQUi8mMwT7W6+syvCoA4R1CbJX58Q
	ca6+lI/cZDNs5G6o/pI/uE2jqtEclCDR8NW3fgpCJyfbCqQlb5snpz+pIu8YWU6JzhhHknGX4Ri
	k5cn5i68PghNMkG9ZItdMwiOJGeS4BeQh2ar42vOi9kbpFquG+R/IZPnTCH19d3KPJNWlez7HG6
	TjKY6yq5/9k4UnI5xxVhEGci/Sv8KRNTDUYc3JHJuocVE1jyd5uVqi0uS5+Sdz0SGEwNZFUJ7fq
	jRn9wIhzaz2J5vvYtaXToul2eHCIVmMN13HVyX0NIkdnRDorsdKZ/Gd/g6nFeEjpFoDjjKhcLSL
	UQ4DmHoAdtOZAbYvrZs8kc9fFULg=
X-Received: by 2002:a05:620a:2841:b0:93e:646c:9138 with SMTP id af79cd13be357-93ebd1bb36emr3369542085a.26.1792140118889;
        Fri, 16 Oct 2026 01:41:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2841:b0:93e:646c:9138 with SMTP id af79cd13be357-93ebd1bb36emr3369537885a.26.1792140118192;
        Fri, 16 Oct 2026 01:41:58 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ac4c70sm32435235e9.2.2026.10.16.01.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:41:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.3
Date: Fri, 16 Oct 2026 10:41:54 +0200
Message-ID: <20261016084154.39009-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad1e358 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=wQmr6_J7Rd46EVQ_6L8A:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX4q5y0fx0GfiU
 IXw9eGeLhee1rp5uY6BVhweLQiNIACTbY7UOwXgkxceuou1+BKKcM3IqT7ZYokEguZfIpVPzrju
 ednwVBFIYDaO/PAhuhMhU248rQtL52ba4Pwr+d8E1C+UqElrDSChdur0tlamaAk/P89nRvn63Ky
 FVvNereO27IWjisbezGxHWdvqdd8YyJbgvFPVfiTp6h9LknNZxcwJlPO5Diw1lgD+LmSu1A33D7
 ET+S+Q4oqrSkjnxnZZ9DDXnHHhRtF15ta72QRfzUG9xdtnFoFmphaRdkVI0Jdyu6tZFXYRtKTjW
 PrMnQKTmCfGmNXOzthOBuatl/VlTw+bLR5Sbj+IrxXpFIj/XXPLWsOgvb1m4t/OohS6kXKT+IHJ
 7bksOKbh30sS/xlT/+iCjqMcFfxvLulcMwbe4nJjvYDwnps8Svf1c/4ciFtuUEe7KGp8k6QpyqU
 yVdvOGegxMUb7MliqvA==
X-Proofpoint-ORIG-GUID: itXzBowrH1n1tiEaLNtoYFLxykGx1Bob
X-Proofpoint-GUID: itXzBowrH1n1tiEaLNtoYFLxykGx1Bob
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX45Jy4xFCoIVf
 x/dKhc6Drpr+kJnldN/ZdZfqD++6HZX43Rbe4NBbkWyB8dgqXTDyywqk8Jam8l8N1EIjqHy+zU5
 iQsVZWrYI38tOOESrAdRAnvr/sRGhS0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160034

Linus,

Please pull the final set of GPIO fixes for this release.

Thanks,
Bartosz

The following changes since commit 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907:

  Linux 7.3-rc7 (2026-10-11 20:04:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.3

for you to fetch changes up to 205cccd06e545694754e1bf8d626ea96e742cd8a:

  gpio: mxc: fix race between gpiochip registration and IRQ domain setup (2026-10-15 14:21:15 +0200)

----------------------------------------------------------------
gpio fixes for v7.3

- gracefully handle unsupported fwnode-only, no-device GPIO lookup for
  shared pins
- mark the GPIO controller as sleeping in gpio-nct6694
- fix a GPIO device reference leak in kunit tests
- fix memory leak in error path in gpiod_set_array_value_complex()
- fix races in GPIO controller and its associated irqchip setup in
  gpio-mxc
- use atomic bitops where races can occur in gpio-mxc
- fix build failure in gpio tools

----------------------------------------------------------------
Bartosz Golaszewski (3):
      gpio: shared: fix use-after-free bug when adding shared proxies
      gpio: shared: gracefully handle no-device lookup of shared GPIOs
      gpio: kunit: fix GPIO device reference leak with __free()

Kent Gibson (1):
      gpiolib: fix memory leak in gpiod_set_array_value_complex() on error paths

Ming Yu (1):
      gpio: nct6694: Mark the GPIO controller as sleeping

Peng Fan (4):
      gpio: mxc: fix race between chained IRQ handler install and probe completion
      gpio: mxc: fix both_edges bit operations
      gpio: mxc: fix wakeup_pads bit operations
      gpio: mxc: fix race between gpiochip registration and IRQ domain setup

Sasha Levin (1):
      tools: gpio: fix building from the top level with O=

 drivers/gpio/gpio-mxc.c       | 36 ++++++++++++++++++++++--------------
 drivers/gpio/gpio-nct6694.c   |  2 +-
 drivers/gpio/gpiolib-kunit.c  |  9 +++++++--
 drivers/gpio/gpiolib-shared.c | 19 ++++++++++++++-----
 drivers/gpio/gpiolib.c        |  9 +++++----
 tools/gpio/Makefile           |  6 ++++++
 6 files changed, 55 insertions(+), 26 deletions(-)
