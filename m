Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792744930;
	b=mCNTOoCjK94vznyIjmBUdiih0z64PUDWcXWi40OCB7DADSCvTh1abm4PKa5xmRaD1JfC
	 t1op06Wwld43rSEW+yZVL832eSzUIQ0XfL8KnDu8g4NQak5JgDi4Z8ridpmMK2ViTIIvn
	 vqkbB9c7bmvNsGm9dPIBGsJrHmV85mkIIbHdFIm3lDVBSB9kF3M8aK4ACNwUvFNTK1ZzV
	 286mN7N8Zq90HE1N2M+R+GFBDpJfooP8MJdYpHqVPxmrCHM2yjRaunj/oxHWKU8c96hoF
	 CxvTWRaXIHNfA2udfQ5r7iuzaVcPHsN5M9uAIig/7TCrIEifJbZhwGkgjS7N0F/RkRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792744930;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bwe/E29eocvMs6PrU+4lRpB3hQIBZS+88pkiXKYtJOs=;
	b=gdo/nno/2wh2rX7nKgbOe8pxvscrPhLllWjmyv7bSdorSTMxwedKYj0Az4Bt/WMDGmVR
	 Wa8lYOp8Y7Gc9Atfs8Is/iUP0qKQn2IywsqJPXNKZohbvIAQVkqjrd1wUbQ2/cjuJGoGm
	 inuZ7Z6Uk55kzw1Qzh9bS6HCRQCfILBvqFG3yoc8lz6I1ehDLrG4p5BpdkBWegYOdkHDp
	 +7Y28s6e+IuikYsw1N33/9lWsMcxdxP8GWktOejtEWN48aHSdAHci1S3d9V3cjnCUBWxS
	 VfmKyGIMaO67mVi54P3G/gZCQCllAD906Ko0ahvwv6QOOPnFR7KplfF3aNfo9msfeHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jkov9LPB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OClqBbRG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC075606A31A
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 08:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC075606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jkov9LPB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OClqBbRG
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FTbX2650368
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 08:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Bwe/E29eocvMs6PrU+4lRpB3hQIBZS+88pk
	iXKYtJOs=; b=jkov9LPBxYXCcS7rrWsIZzm1VUSxll4br185ktXpzEA1C4C7rp/
	gQc68v9NSM+dlUEsyGn3n6cM+O3RkBCYmZpuZ20AjegkDCx+eWNrGZMmrF1/UGh2
	UE5smgUz1M6gI9CCUugPCPC9TUvr6u0L4fKwmZzEcGVtiIdEmK1AVLq5/9x04iFK
	QT6YntkFT2CYloF04okennf0+6qGw2cTZJS4DrFM4Vmpk4W8TqxOwpUG9Mfk5bOX
	E0h6zcZ2hABP9hMGYSSDeVO1U0aRCCEn8ej/SnPRUxlLcZkR/gLwLQF5lfeUwDZH
	zaxDJ2eK4uY6kgfUNCoc06dL+FKq07L2yMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjatqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 08:42:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so127770585a.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 01:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792744928; x=1793349728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bwe/E29eocvMs6PrU+4lRpB3hQIBZS+88pkiXKYtJOs=;
        b=OClqBbRG13PbemscMPLS5BlMc2OXI2pU0qyxzwK9l1zCD3R452oH0TLZiWXXIZEHcb
         fvfTFRLlGcpsVQJk0c6zppl3Ve45mtqq5O5bNba+VygtHu+g4CCQQQrnGYfIv6e+6r9O
         pFj4TuTgNXVE3VhTzNzZUY/lh4GcO3hGDJSfTJn2AMzTCbc/WeDXFnh+3ypng1h0ZIpF
         wCxVGE+qy3llcE1Bvu6arvPJX47cbVjffi72gu9ITws1p2fzAxtzG0wEpnAKagUoWHHC
         /IKk4Q5+gSl4UUllNgNvYB3wCGAmi0DP1Et8IIcEmd1ZQl0BnNcL9w221tvjn+JQHabc
         KG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792744928; x=1793349728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bwe/E29eocvMs6PrU+4lRpB3hQIBZS+88pkiXKYtJOs=;
        b=jAREUVdZKV6tStbHJ0VzBJQy/MHokVy0diM12AwPplUt4gIHdXgB2VyaYKv9zresQa
         zHWrtBZGZYh9aa84GSzlm9YnBXBbod9/VtpE1zp+5C8hddkgSck1+8ajhQNg3mPnzlMi
         eK0Ff8dZe+TRbTQDntPCF5GH+LVU9ReN86JLgCx0NGpfTCEZNGLedoD5hOaMVLsMQ5Ot
         NOgDZnE/6+qwS9SFVKDY+LUkismnmLbhbsMugNCx8Dj8ABqAIUjjfxlzGEeQLoag86FF
         MFmXFkvQ8mcsUU/1sZP+pwKdjjgAiS+iKavhkgo/kybE6m/66B2pVWVfLIKqFlOl6Erg
         KYFg==
X-Forwarded-Encrypted: i=1; AKwUvByGIwN4vCpIqYULwmCDh+J3qOe2KcIo2xZXyJs8PgSkJ3DhuhEIX7eOgTxry5YCqBONUJFT3i6VzXw8@vger.kernel.org
X-Gm-Message-State: AFq9FYLlI6JRl50O0xYphWpMywM6WzCMCGwyOtRLgHd1oF91uIGkY4rI
	qtNuxXHL7/+JIA1XiO46xQSPHqncDIiuaD6q1m4CKWnIp7utBDkfBhFVx4NJOw0+vCp7AzQtL7m
	Z5i6EXwlLbKNLFXeGooJUgJls4ehDW2/pz4YHjnFyZeNyYYDd3cuxggByio/nX4b0
X-Gm-Gg: AYBFou0gTtfIRr1YQ5wJsyjrS1HR2wr+eBpgBj5QOCCJXTqs/DIi2hGKIUn2yUStDH+
	mrJufljQa+IprCxLRlR5uuGvt1fBp69kBp+vwd9bjbgKlTixAFVCg9sylWItrqRwc8wr/WfaERw
	OhGU+RvWxC+8ihGDlFxJxISp3PicK/eMtOQACNUrYvntBusaXfuxcazOeWhXvMOPTKWOG9zlEfU
	MENTvSUsJyvl4b+1dwhzSdXWzFpbaZ4f1SeiqQkHPos+L4PHTEPF0Nu+d0Yn4VJ6DXb2Prr6/8L
	IUyKEUGlUfltkmuw0cRVWUe6YtVwhIOg9DKW6E1tZu8zYf+37QdoUiPHrnmr9Lmc6M/cD5sgbNI
	WqnSpT7DvikdIsrpeWTjQFJn0gsE=
X-Received: by 2002:a05:620a:2702:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-93f627bd91amr718390085a.39.1792744927892;
        Fri, 23 Oct 2026 01:42:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2702:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-93f627bd91amr718296885a.39.1792744895234;
        Fri, 23 Oct 2026 01:41:35 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211bba03esm40720575e9.9.2026.10.23.01.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:41:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.4-rc1
Date: Fri, 23 Oct 2026 10:41:31 +0200
Message-ID: <20261023084131.49264-1-bartosz.golaszewski@oss.qualcomm.com>
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
X-Proofpoint-GUID: nROqUVcMLL6jUpbguzt5uWuls1Gr1bhc
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb1de0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=y2QhiVGmr7caz0bHyxYA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNCBTYWx0ZWRfXx/XUeUDBSc1X
 K/VFmZIUlCMu4gt5atn3bEnSWxSiMZzNw5IFz5TpyQnCAYnri4+jZRQnqwiVXMmGpraGVaUMyUQ
 POfuBL1jE9AeJget9S/oPKPT8B+stn8=
X-Proofpoint-ORIG-GUID: nROqUVcMLL6jUpbguzt5uWuls1Gr1bhc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNCBTYWx0ZWRfX0gC95G8dShbi
 r4YiOWmdmruIwu+eMs3I3kIlUE4KEpbBjhq1TWw+rDS9i8IiXc4hn/LLTfpKVRc853IWzXBZFm7
 YgRzOP2cu4LDO9b+woOhOeXbnjQfE36hTR49csSJyeGp+yO4nAkPOnqBZ6BdyzT4rRgs+0Xpn2b
 awu5rUUaJOH3y7EMHBKhrLY14AVSpave9G4hf/SScZCPdDR1BnWJzEsFkeLp4D4Y4bs/I/gsWBH
 wpLxPrybLPIg3eO/lt4tRViwYR3ycJ3g4wqPR8jvgZby68WNwPE+X1cIZzuRUDWVH+U5u23Qoyw
 x2MFHoiUAL/MhtJhCqBEeAkTqbtU1Uoqy6bfpdTr8UODFe+yIN3rBIaEL/uAtOuxM/cHPOrSyHs
 plDRVqIUFNT+6MeuSnUvhcbLw0c0Jt/N+868GBT3Mij2qosYRGPsP+sWe3nGYU6KQNcFNChp4hp
 daC6FZUPV0Z+fzVDnJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230034

Linus,

Please pull the following set of fixes for the GPIO subsystem. These
mostly came in late into the cycle and didn't make the cut for the main
v7.4 PR and some more were posted early this week. Details are in the
signed tag.

Thanks,
Bartosz

The following changes since commit c03c1a14507dfaf8b856c2608f9ac216021fc222:

  Linux 7.3 (2026-10-18 13:14:58 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.4-rc1

for you to fetch changes up to dae739137441667d67fbfcc4d303a0ecc6618662:

  gpiolib: don't report -ENOMEM for a requested line without a label (2026-10-23 09:48:36 +0200)

----------------------------------------------------------------
gpio fixes for v7.4-rc1

- add ACPI quirks for Thinkpad L13 Gen 2a and Acer Nitro 16S AI to
  ignore a wrong GPIO interrupt declaration
- add missing return value check of devm_gpiochip_add_data() to
  gpio-lpc32xx
- don't set GPIOD_FLAG_IS_OUT from character device code as GPIO core
  already does it where needed and it can lead to providing invalid info
  to user-space on request errors
- don't report a bogus -ENOMEM for a line requested without a label
- propagate errors occurring when setting line values for pins for which
  we emulate open-drain or open-source drive settings
- fix interrupt handling bugs in gpio-pca953x and gpio-davinci
- fix more memory leaks in GPIO core
- clear event clock flags from pins on GPIO release

----------------------------------------------------------------
Abduvaliy Abdulazizov (1):
      gpiolib: acpi: Ignore GPIO 11 interrupt on Acer Nitro 16S AI

Adrian Ambrozewicz (3):
      gpiolib: clear the event clock flags when a line is released
      gpiolib: cdev: don't set GPIOD_FLAG_IS_OUT
      gpiolib: don't report -ENOMEM for a requested line without a label

Baek Kyu, Kim (2):
      gpiolib: Free chip resources when allocating the label fails
      gpiolib: Propagate emulated drive errors when setting arrays

Bartosz Golaszewski (1):
      Merge tag 'v7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-current

Jayaraj Devaraj (1):
      gpio: lpc32xx: check devm_gpiochip_add_data() return value

Kent Gibson (1):
      gpiolib: fix memory leak in gpiod_set_array_value_complex() EPERM error path

Mario Limonciello (1):
      gpiolib: acpi: Ignore GPIO 11 interrupt on ThinkPad L13 Gen 2a

Sahaj Chaudhari (3):
      gpio: davinci: Clear interrupt status in every bank on suspend
      gpio: pca953x: Preserve wakeup accounting on parent IRQ failure
      gpio: pca953x: Handle direction register read errors in IRQ paths

 drivers/gpio/gpio-davinci.c        |  6 +++---
 drivers/gpio/gpio-lpc32xx.c        |  9 ++++++---
 drivers/gpio/gpio-pca953x.c        | 21 +++++++++++++++++----
 drivers/gpio/gpiolib-acpi-quirks.c | 31 +++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-cdev.c        |  5 -----
 drivers/gpio/gpiolib.c             | 32 ++++++++++++++++++++++++--------
 6 files changed, 81 insertions(+), 23 deletions(-)
