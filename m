Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C06F3AAF43
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449717; cv=none; b=p/yxxVwLlDxKlg06d1+wAc90s/p+dWrjTh5tA+c2H+W6aXaeDBYzjmqMkp82vyC93CrV4OR90pg7F34e44ryKv5a9qZ18oNgLkoYH+CkUweAbrkfd3UyfZQrv36n7hDXmCQ71lRkTRkFVgBXAJ9ut3Ou0lWcWurtEte4J1JRib8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449717; c=relaxed/simple;
	bh=s3gC6gsgYrRYCi7vlJQcmCDW/z3riFeIcysrnzUXaVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VxsgJFbmiC+zSpbdASbcP1vnam7bpiVXAi8uSJvFQgXQnkgOejpDnFaEB/tR7EooyCkSZcLJ4xT32vdr3oV0iD33wvWdDFaWgE1pAYIq7Vvnr6q1dNj55n3/XmXdvNmiccZg8atiM6+ngS5QnuO/djxLrRGzMMIOWz6UEQY+WBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVYKGVqx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aivxqoaI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVYKGVqx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aivxqoaI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K3dT2189811
	for <linux-gpio@vger.kernel.org>; Thu, 8 Oct 2026 08:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FEjS5FEZuwM3ZCGKpsUAP1vOhfvNdfePeWt
	JrPWwgQM=; b=cVYKGVqxKMSJTxFSbKsk6A/2goRNqzVdoaAzG6Gj4wMlsGLvlc/
	jgnuwnBgblUcCzYRoAe0L5d+tfdIeeT6h3gFzA/LO5Gm9umulIAs2XWlZQrBgPDr
	z+uKZAHSh4zIRc8kpxa/MmFcZi6l8xgnyiMfZ784d5YR6c7Br5Ywxzm+MXEivBdh
	TB1aauxSFWn3aa4i923ewQBJDnkKlX+Bv4hbQkkLj8njnHU3C+4dseoZrhYogTc8
	18M9q6dzayfqFaeZjyJPxJ5ClFCpyns1q/wGKTNmEq+rlHrdaK7U65Env+PDsiVg
	/mGTIqdXXLhxhhrxaVWFCye7s8ZfV6F6AMQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3a04a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2026 08:55:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso558301985a.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2026 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791449714; x=1792054514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FEjS5FEZuwM3ZCGKpsUAP1vOhfvNdfePeWtJrPWwgQM=;
        b=aivxqoaI6nwPVnuIjzheu8hkR6uAEswzEeU84zRVRFPUBhnc5k0pzaz/jOhG+eoSrV
         7GT90RdaoTywfioKU3u13zDvFw2Q1rASMwAD/cs4x/+1T9qALBBY1jsqNEs39UxB8Z+m
         /7gHv/Bw+9JRgLTzRCgFHcmcoI0U+zWuuK5z5+amdV1TWNyOOjlMi9M4WMmqsuhczZvL
         xSVA7V1df1nFOVFi15JKvNI94fbPjxL0rsbxNfOvmHesJP1YKjaxRswpCHa6Wedh0Ito
         WPzyrk+5fUMW/bv8QeXmVOERcWFw4MBATSzPDzAZP0KFSPTYPicP4LCDnhZZQduApGW8
         dvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791449714; x=1792054514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FEjS5FEZuwM3ZCGKpsUAP1vOhfvNdfePeWtJrPWwgQM=;
        b=amvocSgDoTY2vHq5jkgrtwjdCeniyUbKh21iYodpP+pw8OY4R/HI82QKgG65rguDk8
         ahOQdWVxTBbo62KxdS526JKEpWozVAxEKoGko407KUCB41VZYPDCYc0LPsPAtw+9Qd0i
         emuhsFgYtkRkpaE6G6Zx5W5H5Nyn2Jr2NVwIFACqGGdiKahch9OfARZ1ulAEc7zscrDB
         hvMtjCSrw2i+wdj5tupbiROh1VpPrD2A0DGdHYCuxvptohil1BxKsQdSG+83VRxQyk1E
         lZJjq+gHsD5RLQKBCW7qtR5atflRohSa7DR5WdC7fLTwWGeDZ+TQi0iucysKAYwrcu2l
         lK5g==
X-Forwarded-Encrypted: i=1; AKwUvBxOuvjbheVzNnncmdt5yHSh3mpNN1deCVp+pO4bjiIc9iCJQQknLvDa2GTgBIoULb+igZ6C3f/yOcDY@vger.kernel.org
X-Gm-Message-State: AFuF++lvqxFuKs7FSWi7yR9LgnYmSCDSv9/tsNHBwkOLSy5BvsNYIyS/
	Ji7/D6BA33iVBbdfULYyH6wRDYXgZRz28C1qkrpImpu3Ju6hBCtvdVct/4rguAwHSOLAL0UUIRu
	3vhk1KjiUEwb0/SME45e5nT9hfvwaEvHjO8B6OVzF2MJZ9LHbJH2Di1scqdR/h9wEE1gwmDxX
X-Gm-Gg: AYBFou032ZDk0NkL2AUqLKirClzTL+epFZhPbAS+hF+Rzh+Y5MXQdS0lFo4xXqYKV+H
	Vl4W1ORPZdlX+UVL+4EK79cTU5gJJF3fwo/+tMsYYYnZg8MZAfrXV6IyBSt897y8RLlYG1Ms37M
	jkXf8vt9hOh1u6M0w8r9+0HgdlM5gRa6lRQUKm1kvSsBBxfhx0MjYWp8rhiB2QwNf6z/0TNJIq8
	yKfCtE+kkGtBQasnHR+pXjdjsA5MThnlosdg83z9dfqmu5v/ESoTsZEOzYifM8/tLDfxdU+CZgb
	uSQMZCc1ZIOblIwixlNdxLov+IvKlej31wqsQ/G+Mnu/gO2Eugo3obAKzQOjXULtMJsEWFeyply
	OPVjbXY3fmcrVVF2cyxvy2iCCxWDUmNiU6DgaH20q6rTvEQ==
X-Received: by 2002:a05:620a:3726:b0:93e:9809:3366 with SMTP id af79cd13be357-93e9b839816mr943852285a.71.1791449714296;
        Thu, 08 Oct 2026 01:55:14 -0700 (PDT)
X-Received: by 2002:a05:620a:3726:b0:93e:9809:3366 with SMTP id af79cd13be357-93e9b839816mr943847985a.71.1791449713708;
        Thu, 08 Oct 2026 01:55:13 -0700 (PDT)
Received: from brgl-qcom.local (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b65fsm9772393f8f.16.2026.10.08.01.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:55:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.3-rc7
Date: Thu,  8 Oct 2026 10:55:08 +0200
Message-ID: <20261008085508.4815-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac75a73 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=Rr7pUO09KOWNFGsOlfYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNSBTYWx0ZWRfXyeYpzMPg8/BB
 hh+SKtJ4r6GmVQnYrIX4fAAvedrrWJLQ+cwIodKVc8szTh0e4RQv8HaFd7Y7WmANgSuVz3q0n30
 BqaSuT9/F/4uB2YOMhYkUdAQu/VX4hc=
X-Proofpoint-GUID: cl5i0uTqJjPkKSDHip6KcfwXLIvJKQys
X-Proofpoint-ORIG-GUID: cl5i0uTqJjPkKSDHip6KcfwXLIvJKQys
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNSBTYWx0ZWRfX/9EuDLvLEXqr
 +QGX4YZx6PWA2ZRQ9kp7HOhtkN7/C48SU9qxRRLGyqUfecoZKH/rwUPtPZvWhzHBV8ZSesORJbh
 3BHFi0pFYY/Mv7vJlSSHSWFOWqVetThApJ9H4tDr/JRVwcac7vYVQCYpaPKuoKXysI3eWhIHNkv
 qRj4WmlNvw3Efqcw1s62X2ijpVuuBm8hKXHDTq587cfOJvTqcKPmVQVG9pAnKfKmIeXpz0YZ7gw
 UyUTNZdfVBnnmeQJVe0Z1BQuK31VNGgstkqUAPkAGx4CrAKg5POHZN0RHBjcHM7Fnozz/PJeVXF
 Vdzlwq3j00Lh9wWllmVFLTMSFYfOSzg5EnzldFhvBqV2k4HkeLvC+6PswRPdW+/WEFz/iOoEwIn
 ldrNWyZ7Nbzk685pkvzVbAi851TBk6F+WoqyEh6nOcUr1BmkHhPYcVuMnwylmyrdtN4FAZhvajh
 D/xIto8ettOk+ch9mQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080035

Linus,

Please pull the following set of GPIO driver fixes for the upcoming RC.

Thanks,
Bartosz

The following changes since commit 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e:

  Linux 7.3-rc5 (2026-09-27 13:55:01 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v7.3-rc7

for you to fetch changes up to 7efa1a1953cd6b20b23a3524d5b4b81789c6ef25:

  gpio: mpsse: fix race when arming the IRQ poll worker (2026-10-01 14:28:45 +0200)

----------------------------------------------------------------
gpio fixes for v7.3-rc7

- fix runtime PM leak in error path in gpio-xilinx
- fix race when arming the IRQ poll worker in gpio-mpsse
- fix devres cleanup path on probe error in gpio-exar

----------------------------------------------------------------
Fan Wu (1):
      gpio: mpsse: fix race when arming the IRQ poll worker

Ridham Khurana (1):
      gpio: xilinx: fix runtime PM leak on request error path

Sang-Hoon Choi (1):
      gpio: exar: initialize the ID before registering its cleanup

 drivers/gpio/gpio-exar.c   |  2 +-
 drivers/gpio/gpio-mpsse.c  | 24 ++++++++++++++++++++++--
 drivers/gpio/gpio-xilinx.c |  9 +--------
 3 files changed, 24 insertions(+), 11 deletions(-)
