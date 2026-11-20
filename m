Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180169;
	b=ADVZjqJpskh8UK5mr1oo95nlY5x7fQFuT4DYTIOF58Ik2SXoYd0gX008rDqggxDcKNzn
	 cyo729C86IWQ1UTcHidtpU6DISTa7SWisH0P71Fg6r9uTzKPrMzLQAUkfzd8aujUhj9p9
	 wEWszHfCV69gLAsQoCNMKeBOJVMsV6S8naHS+sWNBPzYjFAnSxHx1iUkpdvE4C3CJBrQq
	 ZxsIeD40eJfRYYBkCnsQjKH3Hf3enxXFeR+tJhNH/TzLluxFI30wAWbEhx2wtCfXyZ6oy
	 CYRUU8lTLm80NbYQcI0VwqhCognkOD6mWlU9JiNVxtEswNl+pl98drdNF5LijgH2lag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180169;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BfGphMSJHSZQ87+RM9UdnonKp5M5o+whIFJ9VyZKxaw=;
	b=3yxktS3epZFhQ6GG2ORcSZJObLO+MIVwKuzCYAYMzEcHGURhUOrVRLt5Sex5H/SaEtlb
	 h5dA//mCohVtLJH9qCSYVZCDMlU3IYW1fYYYFtnPdNkTr5uQ/3XsE+Lqd3wvA8/6gtmGm
	 +T6gO0OJxvr5/hbvM4knhsqDFJSJ6okG1h6GU2mMNYUh9nfYxvjycVfx9GsOEEVOVtdDF
	 FWWRmMedV3hgP7lIWBvrQGRsRit7fOkQeyZg5jkYykmnZaUTyygMIwwgkPV/KSScMXLMW
	 jat9RidIJ8VAN5cAT3hve09eCcj1ayV0jZKenNtCHKc+5trWU38SPxMtmv8BTRZ53oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwXdY7Xt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NoDQKvdm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A412C606A320
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 13:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A412C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwXdY7Xt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NoDQKvdm
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKCAs9B1247345
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 13:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BfGphMSJHSZQ87+RM9UdnonKp5M5o+whIFJ
	9VyZKxaw=; b=fwXdY7XthpiYtMiAfXIikQFXzC3tBxFd2PpIGGUW1Qiejpck48/
	s0A8dsKUQAEOAVuQTvWFFwtCbJiysc3q8ATbiN3Z1psBorrPtZAbPLNTJ/R3mYWU
	HBaiCpFpnLMG5e9kRasAYvwU7aIP6VNdxV/8yVLRp71fh/I6TgjlLJxQLYWcG92t
	I0ejwYrRjTVT4PJmwAo2aWumqQLTdcxIrs8XwF1gf00v6E0afLYpP/cPgfne8oy7
	rqYAbHjk5+esMu3cu7e9lIf0GFCHkwnpXhvM2ZCJsbXq0sjuW1gsUzwjNxWGGlbM
	7aRfR1uOtpZj7T2CWiRjw+jGS646aamB0Qg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyktfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 13:09:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495dd0f07eso172239385a.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 05:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180167; x=1795784967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfGphMSJHSZQ87+RM9UdnonKp5M5o+whIFJ9VyZKxaw=;
        b=NoDQKvdmeo2pHX2Wb1NPBOqaVOyXJrwY2ncxuEG7n6niU/tsWQmSNS416NYvehPRy5
         AC+LyYo9htKyVgKqpCt0e2AXoR10aIBQP+s3UynTAwXDij3GgnqJ65FwqMqCtmACJ7nO
         1vDvqvBJmMDi3BahFFsgjC+4sPxcW7yztaPN1xy4FsShXMlCfoGo6ckg0PH3RXAhGylu
         avdumpVT75fKclRm4hFDMHJy8634MOWba8dtJ1V9xpMCCJGpEJ3Fb17+mBI88970gR/A
         ofOX9L2PyR41K8RmgMVc2lSopzycm098T7u+EaZXBZsdeqyEcL66PNGif30t6Q3qOmHB
         44/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180167; x=1795784967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfGphMSJHSZQ87+RM9UdnonKp5M5o+whIFJ9VyZKxaw=;
        b=ZsTjK4enpv/WBGSPuKVHQc19An3SayClcWmKvQd8+ZOt/xfNHwOd8jExuRMxteGT7P
         iPDiOyut++bHnqrIMsNovV4ERLHbshbkdCYqgBlpqXAEw/bz3R8JJCG/iUGAhD70AzXy
         FN3qHfjhrnju7DtwzMn+qfBE1a0sC9pLev4MgR5bIr48ex1slNqtUBm5RVnwc2ke92pf
         WKyYYh4VhftNVbdRpy32ulomwpLVa5WZvt1jZ4RvPJ30P6OG7eIH0AEDL9rhuNAy1VNb
         bqxJVFqCaxLBNOEusNTUOFvcojkjDxZyDCePDruiTMDZtD1gY9kCylw8HXuTG+2YI9zN
         Bb6Q==
X-Forwarded-Encrypted: i=1; AL+hErHc77YyqjIP36w7z9T902JMapNAegS09x9BAEwktyWHU1zgZTMTLND+Ky1uKIScbTWqYQoQEmAwVU/n@vger.kernel.org
X-Gm-Message-State: APuU4Z/Cq9v8mBEvveNzhkwzCe1AwlAuZFFwuHLyLae0PfcLvp0bb18w
	yUIz09CBrk8rG5WBcPvhaFzQy9PGNKzG1HRGp/DHdM6cUhf3IkWBdZ7FSVywttiFtv2SZXCf9PG
	Ois1ZMea2qoQaG7Suk/yoFJtoEU4CNH5Eb0PGe3kaHFbH5agulWND5YwD3fCne+kC
X-Gm-Gg: AYBFou0euo1Ten36lZw8/BgiW8h8iTKtGlLCI7s1+4izM4NPXI8qQm5Gqvnf70gJDvu
	5KTooa5cpPelYr9mfei6Yw8R+dSu9lwOKbNk1sXmcQ4fPLjPnVEPoUVvSZ9Xng0TBKaMb6V7O1T
	L3PQAyEcBbv3SEk98gzbI6QxxEUCIUZvfUobk+ru7ONfHw4bFJWefke7OFDA/ATiTsX0/2/RwIo
	k1vurYvFPmBaZOFph9SPdJTLTLHwiAA6YjJznqEp3PpCM3poPNHY31TH54yMi118ER0uf3X+RLq
	L0Uz8XyyWPQhJFoiX/0mn1I437Z7R8RJxf6cAqXqUtw24gtBB8oPRyuSRm+dx5FHUOeL/DS01Oi
	z0uwssauptmecAhRqFe5IKdVGBs3Ci8iChWL1mVyrzISN/PJMf4pisONZuXwEpUK1sBmwkTSavf
	E=
X-Received: by 2002:a05:620a:2945:b0:949:6574:f36a with SMTP id af79cd13be357-949ba9d02e8mr477754085a.38.1795180166631;
        Fri, 20 Nov 2026 05:09:26 -0800 (PST)
X-Received: by 2002:a05:620a:2945:b0:949:6574:f36a with SMTP id af79cd13be357-949ba9d02e8mr477747485a.38.1795180166030;
        Fri, 20 Nov 2026 05:09:26 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm5780973f8f.31.2026.11.20.05.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:09:25 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.4-rc4
Date: Fri, 20 Nov 2026 14:09:21 +0100
Message-ID: <20261120130921.29111-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MiBTYWx0ZWRfX+nEhtXvQmRuX
 +si58pkYGI/L5V4ZfreqEJNL+SREFqTuqJ278DxktRPbxLnKSRpWQv2HjCkyGND3c608KE+wnk2
 r7kHtDikLu4+3UFRIX7EAm5NBFMhzk8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MiBTYWx0ZWRfX7dg1Pbl/gKN9
 X4xV8eCaJf9OSeNOjGCoqTrWVH/c8JKH6b3nfl5tWFo4bkRoF6cP06Skjnmjr1bDc5p/8KUmw4u
 jCduXq/P92bBzdBWad795f2be01kFNvOG8LaVvioE1vTgZgIwqKI0v+/gysHNzdFCR7NUjWgdEB
 7saMLqMNDnnjCOlEYlP5c6Osj9Zj5SHivPH2h6jrW8CdSqZMqXuiivbuIrRG1suHozLhepm+Waq
 mdUcDtXc/GlHvNgcsx7ZC5/HnqLMFFs0B1NFebWNf2sjihIm/dNapdRvJEjGd5K7Pe4PGTJFm6R
 1ATirXn4zs1PWiZohsmLVWDWB3mNnyaeg04raAIbwmJc3TibOqKT3uTrvpOmeREbrmhysN1+UuO
 F6d2ZZ85X8yDMcklkH9lR/+azocxd+1v6loCPVhjtssh0V+/T1RRV+5E38HDwJi/DVpH+3Goh08
 65xxA23b6krN97ks+sQ==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b004687 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=ZPUh5YY5edBcq0qQK8sA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: une03YLBvIy8uj1oV8fswKbBY0D6KvL6
X-Proofpoint-GUID: une03YLBvIy8uj1oV8fswKbBY0D6KvL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200052

Linus,

Please pull the following set of GPIO fixes for the next RC.

Thanks,
Bartosz

The following changes since commit aebb7274476403040d582c61478df8f4a7bf9cd3:

  Linux 7.4-rc3 (2026-11-15 14:30:11 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v7.4-rc4

for you to fetch changes up to 31678e68f82636a27fbad58ae40054557da4fd7e:

  gpio: shared-proxy: propagate -ENOTSUPP from .set_config() (2026-11-20 13:36:53 +0100)

----------------------------------------------------------------
gpio fixes for v7.4-rc4

GPIO core fixes:
- delay freeing the line state workqueue to device release and fix a UAF
  bug
- fix races in access to the flags field of GPIO descriptors
- clear the debounce period field of struct gpio_desc before clearing
  the "requested" flag
- propagate -ENOTSUPP from .set_config() in gpio-shared-proxy

GPIO driver fixes:
- check the return value of clk_prepare in gpio-omap
- reject bulk-in endpoints smaller than 3 bytes in gpio-mpsse
- validate the pin index of interrupt events in gpio-ljca
- disable interrupts around the chip lock in direction callbacks in
  gpio-mlxbf2
- fix line name handling in gpio-virtio

Other:
- do not clobber errno on read() errors in gpio-watch user-space tool

----------------------------------------------------------------
Alexandre Becholey (1):
      gpio: ljca: Validate the pin index of interrupt events

Bartosz Golaszewski (8):
      gpiolib: don't overwrite the entire flags field in gpiod_get_direction()
      gpio: shared: use atomic set_bit() for descriptor flags
      gpiolib: clear debounce period before the "requested" flag
      gpiolib: don't overwrite the entire flags field in gpiod_free_commit()
      gpio: cdev: don't overwrite the whole flags field when configuring lines
      Merge tag 'v7.4-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-current
      gpiolib: keep the line state workqueue alive until device release
      gpio: shared-proxy: propagate -ENOTSUPP from .set_config()

David Thompson (1):
      gpio: mlxbf2: Disable interrupts around the chip lock in direction ops

Gu Bin (1):
      tools: gpio: gpio-watch: do not clobber errno on read error

Hyunjung Ko (1):
      gpio: mpsse: reject bulk-in endpoints smaller than 3 bytes

Jiawen Liu (1):
      gpio: omap: handle debounce clock preparation failure

Lianjie Wang (2):
      gpio: virtio: bound the line names block by its configured size
      gpio: virtio: compute the line names size in a size_t

 drivers/gpio/gpio-ljca.c         | 11 +++--
 drivers/gpio/gpio-mlxbf2.c       | 29 ++++++++----
 drivers/gpio/gpio-mpsse.c        |  4 ++
 drivers/gpio/gpio-omap.c         | 10 +----
 drivers/gpio/gpio-shared-proxy.c |  2 +-
 drivers/gpio/gpio-virtio.c       | 13 +++---
 drivers/gpio/gpiolib-cdev.c      | 95 ++++++++++++++++++++--------------------
 drivers/gpio/gpiolib-shared.c    |  5 +--
 drivers/gpio/gpiolib.c           | 39 +++++++++--------
 tools/gpio/gpio-watch.c          |  2 +-
 10 files changed, 113 insertions(+), 97 deletions(-)
