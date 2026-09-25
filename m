Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C635E472061
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 08:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323335; cv=none; b=SSX4DpWHGnNE1KecgMaBNm9HT5gJYPHoOG5jRtZ36/Kkj2HDcepXDd4uutFVaKX4f3jrEMLRJmUmqn7vxgoqXmzYJwGgf1NRYa6LQzglt+ypMbfDML7RWA7zn8Vax3TzoiLJXZFga/gRQcJU/ePxbG7x3bjrFX9X/TunlNLZwn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323335; c=relaxed/simple;
	bh=9fbFmR9iY0bRKtXRl8r82DlzR/N7O6JJecGIFx60540=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o2V9hjaEfqaA6ophmb8kPQ+mWcPKnjDxlRL3orx7229CQY6Mml4tu609YdC8YmRitJfm0jWye1Hxx9x8Jl3SN/AWkRVd5WLCCR77ahebllcqFU1jOfwu1faOO19d5wB2FjJRRTjvnW3lUNzrBZeyZpI7U1PYGt7pvwPi8d/CbjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJQ7Ic/c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pk7/Rj/L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJQ7Ic/c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pk7/Rj/L"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Yi8d4102879
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 08:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2LxWyDlvs6Zc7Hauu9RxcNc/fgAYjbcpM+O
	YjZnHY0U=; b=jJQ7Ic/cW5doLqfvvMp7zaGEP3y3r5GWD4JKiof4xRnKKNkZGWv
	8wkucODjn0ZmvenjdVp37yTQN1BlfGxRmd4XhJSF9cBg4yFsa9BnRV4kXuEAFdy3
	NM9x9Fu8BowAAW3GTfd1CJF69YefUzx/Z+0FXN9TnRAUiiKYnC3z1owRJIa6Bph7
	OPFFvrYNJY5yTM4QZn96WnDU+IfwzoKQAw1k2oqyRbTveutA8L8WwEEIdRw3Q0eT
	NpcB9+7soTThcOKZJLqw/AaqV7Kry+6X6mtGC2F/y0SF+Oe5NrS66544XsLjzHTS
	gHjL7aA0jeXHsuwiYhrpX3cqwPkd1n+LCnQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw5q8udv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 08:02:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f248907fso63132785a.3
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 01:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790323331; x=1790928131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2LxWyDlvs6Zc7Hauu9RxcNc/fgAYjbcpM+OYjZnHY0U=;
        b=Pk7/Rj/LkVO+fyp/NNrsqGTMnyluC12uZnyXePM34WYyNeF7DQp5iCwq0dGHA65oVY
         iObjTBpUUBiWyPZ48Dti0jivmvyL/fvdhEQQshIQZ4TSDBEdR4dvoWkjO9FLuUEdc8m9
         NHj2Wzz5u9EoCg2RyjKDDvcveuW4wSdrnZTfCflRWA54t7T0wmpj9GWZdZS9vej2m4Ch
         /gTgoo9oBb4RJV16IW1o4oVKfFqhwG+EC2mtn8XWBakcaHsypSsmIhFkn30Iy8xR1AyQ
         5U6RSl7Uzl095oEhIP0yMSG5pdTLARo1rzFRIEenBBOLOz82JTFlpyIMK6oNZkEmBmcc
         rdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323331; x=1790928131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2LxWyDlvs6Zc7Hauu9RxcNc/fgAYjbcpM+OYjZnHY0U=;
        b=vKwvSlIR8sGuD3b6yahqamq+xPWDbn18jpNteXYyC4n5fMhh1Ssypkw3ufsZf8XB/A
         uEgW3O0XalKSSIQ0tJ0Mk+KJQ4XOq2xfuhPxgp4S5Mk+E1dncXC6R33fo0bDEM59uuZG
         6VLmptUw8CLLRXTpXqAXBBH3E0u15dH7/FqlA698IOMVLQ4egKF+usWHdywUas6Y7wuH
         BT/2HoZ4p/0ujXhRYieczBqYuBvd/Tp94RHySTFjRh9GgehPD1ugHHQeJm8KQPphYkjw
         T9jwgUzNa6BzHn2pxFX4RSqHAvqO3KB/Dv75aE0u6fhttxwyHL76wmtXoEvk9NeONMR5
         iBKA==
X-Forwarded-Encrypted: i=1; AKwUvBw0gYB/e4HoSrja5jBSJn6IuJOFCnFYwsJTfPitdBCAXwjrJnIR1pGuIDcEYvBnKRUR78yxKgXQ5Cyk@vger.kernel.org
X-Gm-Message-State: AFuF++mttQYMjl8A9h2R70Q9csCZBnqQA6TxQtq/fnJA0UO3TxEq58Vy
	7P1EZSid6h3FKKvDJeltlJBeFkmL5R6zCR8bJZiGC1/PBGDEjFgdi8OxVd2DBZ2qT8ze4ilg0F0
	3ULSX6zgdE7T81JYwW6x89upP9rnVeMqHBfUzizfrN57km3plHvIvfW7ojYW6I7Wp
X-Gm-Gg: AYBFou2mEMSmeb1sgCkshsCVCddJK+y1httMnBJVsPVkQQKDOaPZ7Lne3IXkJKAejuX
	uSxPsetfS/AO3xU7Em2UOTYxC3DD3ar6IVOd9XvAp4zZPN8MlSBKUGsuwhwHrYmjQryTBK7wjWV
	KMTAptjt8bQ8sBbBQAoINCXl5XEIecZlvVsV/G4SVQYwhDask839Y/NzgnqCJMVD30zFTM0SNG0
	zO8a48okeK4EuztoplQma30q4SAyEa4YsreyVPNhjZjho3tLYCOTt1Mgk/qr3fpMbjsKFEox8+h
	meBWJGRYu71n5Odx9P5Go1U1DvUU0Rl/YdOD/DGrDZ1iFke7gIdupbHkpWIPNvaLOj3gcRuxjad
	+wrH/wbuI6RCY1OtmFjx5wB/aMfU=
X-Received: by 2002:a05:620a:26aa:b0:93a:2a59:2ad0 with SMTP id af79cd13be357-93c43bca4b9mr322849485a.16.1790323330799;
        Fri, 25 Sep 2026 01:02:10 -0700 (PDT)
X-Received: by 2002:a05:620a:26aa:b0:93a:2a59:2ad0 with SMTP id af79cd13be357-93c43bca4b9mr322843985a.16.1790323330228;
        Fri, 25 Sep 2026 01:02:10 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bde1:52f9:d7f0:c581])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a36189bsm4918793f8f.21.2026.09.25.01.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:02:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.4-rc5
Date: Fri, 25 Sep 2026 10:02:04 +0200
Message-ID: <20260925080204.9234-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMSBTYWx0ZWRfX9LIzKkRdHsVw
 xijOIzLbGhgLrLYbISQKD9bpJYVN+Rvu8W4XCWMnQ+oAyukGkuyXYhIn5ul5tM/ahgCKNX9WTTb
 lowwHnGL+e9fbimU7ECRaGqnE6LiXNw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMSBTYWx0ZWRfX0H/yTIIZRHj0
 lcho/aK5wWbBZNttOhg2PkAO9flTjtoirhvILplGLkukkFHEL3ruHJZSQFKe3KdKUaN2VtZ+Fby
 FV53LjKSHUP1yNuA2QxdPDDF4NCzESnUY2u25ojxydxr8ACnQVrYzBXyNYEVh8o2Dphfv6DcahJ
 xw0Lym42ufC96fK1eAtFEwxKy88ESXlAnH0gHLgps4cbkHZxv+0h/fJGJ8DrhTYtFa3wTeWXYtU
 ylmy9CzYeOpDszcv/jqPSg16QPot30UWlRgbgl5eOZKklLeuHQoR/DHbpT716iKAX2ggVGQevkL
 b06TiOcPFTG5g/5i6+uco2P0xzIZAuCKD/DKNNXHx6fYAC68dRexlxY9Do0qBcVmZdDT+R6afAv
 Y1LLpaV+H47PhlGmjM+l3xBiP8WHOaduiR26QBU2dPZkp7KDGRp/eqZSNoTYXnOLXI8/D1bG6kp
 edKCuk7wXx+3ffhfmVw==
X-Authority-Analysis: v=2.4 cv=SYRi5fRu c=1 sm=1 tr=0 ts=6ab62a83 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=iA3Hgnq0jmySKlLmdQYA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: szivKOpdttWVg7Zdos-sArpmfTGmPuxq
X-Proofpoint-ORIG-GUID: szivKOpdttWVg7Zdos-sArpmfTGmPuxq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250031

Linus,

Please pull the following set of GPIO fixes for the next RC.

Thanks,
Bartosz

The following changes since commit 93f51579e7df248780214094418f205253383cc5:

  Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.3-rc5

for you to fetch changes up to 270437f3fe62516f16482742a7762a075e7a9457:

  gpio: tps65219: Fix TPS65214 GPIO direction programming (2026-09-23 16:42:01 +0200)

----------------------------------------------------------------
gpio fixes for v7.4-rc5

- fix a regression introduced by moving GPIO hog handling into GPIOLIB
  core where of_node_name was used if line name property was missing on
  DT systems
- fix kernel stack leak to user-space in error path in GPIO character
  device code
- fix runtime PM leaks in gpio-xilinx and gpio-arizona
- fix several register programming bugs in gpio-tps65219
- fix interrupt storm on resume in gpio-mvebu

----------------------------------------------------------------
Bartosz Golaszewski (2):
      Merge tag 'v7.3-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-current
      gpio: cdev: fix kernel stack leak to user-space in error path

Frank Wunderlich (1):
      gpiolib: use of_node_name if line-name is missing

Karl Mehltretter (3):
      gpio: tps65219: Fix GPIO input value reads
      gpio: tps65219: Use the variant-specific direction callback
      gpio: tps65219: Fix TPS65214 GPIO direction programming

Ridham Khurana (1):
      gpio: zynq: fix runtime PM leak on request error path

Rosen Penev (1):
      gpio: mvebu: keep resume masks within the irqchip cache

Wentao Liang (1):
      gpio: arizona: Fix runtime PM leak in arizona_gpio_direction_out()

 drivers/gpio/gpio-arizona.c  |  8 ++++++--
 drivers/gpio/gpio-mvebu.c    | 33 +++++++++++++++++++++++++++------
 drivers/gpio/gpio-tps65219.c | 12 +++++++-----
 drivers/gpio/gpio-zynq.c     | 10 +---------
 drivers/gpio/gpiolib-cdev.c  | 32 +++++++++++++++++++++++++-------
 drivers/gpio/gpiolib.c       |  7 +++++++
 6 files changed, 73 insertions(+), 29 deletions(-)
