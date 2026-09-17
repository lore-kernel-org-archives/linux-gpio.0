Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58194AF9F5
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637702; cv=none; b=JqIxnhK6p7kcXsXr/6bde//EqYtHD2j2zWNDPSCkBPgBhosDPcZtwEwdgBmEXggE8ST9NxESQHaCBGY0evjgQpjEZjA7+n8gABMmLihuU1Rf6FZWXM2907BEdnanv3cunZYn3aFqf1RN1UHm6i8DBtoVmgGY5Fn4AI6/+igjH8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637702; c=relaxed/simple;
	bh=U18JvJlreGZyY12ZpRMXUzcuuBGhGVLha0N6/E1/I5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OIdn1WsQMbta1lIpctsjYIHC4uOf7pvWiZa7uwqQQCjSaNimOFvdhwJ3JwS5p8aaeCj4/uLJBbsBZSGWOG0HC+54MVCVl/HzZeV/JOruWat41EGGPaPTKWRTiGsih4oWWwWxMI3c2zsY72rEOKtRkp0CU9csWjhfJ0nhVP3Qi4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TWGOgJQF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAmhD45W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TWGOgJQF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAmhD45W"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60Dn41721165
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nGegAhrHwlHP92QZ0hz4XHBiZPTgOX1xYug
	kZhJgZhk=; b=TWGOgJQFUmLaEGoH+rkRgIEi2RXq9TZ0ej91zqmN+xUkftVxtNp
	Pws/ErTsWOyr/rv7VW7nudXGsLNthuXwAowIbiMtL75lh6kq0eSFppRYE6UBfIhf
	CwDEdFKs6wSv2jGRPbBKidGQVnuvPbGgRMzqZ0FjTltHpkmZEVoMy4pCSs3PzbiO
	xyRHpyU76CuWtYf+3AS4YD+SeB/euOb7FFqvl49nTYNnCQE3Bwc9d5G/ScDp13S/
	JJ3uaxRh6MGhYhoBG9YYWlEnXwEKmVwor0jumECF82ozzNhpxlpRMuSAKjzbl4+E
	nycHxQljK7d83wiIbTVcvHep4MI9M8O64yA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m1k5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:34:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0c7126e7so95177085a.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 02:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789637688; x=1790242488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGegAhrHwlHP92QZ0hz4XHBiZPTgOX1xYugkZhJgZhk=;
        b=RAmhD45Wps5Bq3f/iM9irngiiXbYKhSdD3ajsZzK5kSOzzq4h6wpiuw/jfqDgSx2Y1
         JxrLao//Jwpo5MzF0QNZ+I+5W+DPR59xUdBZRTbuRUU9umzLpge/F8x/f/vEyBq1ff0F
         mWCdVbxamyAqL7w9BTOqFFohNYjG518HhL9ATaU1j+bUtXt2J8VBggMG26q1hIn5wHEE
         jzskFMhpFqepm3JNapXN3bkfAs+uAUBez2hVT9bxRLdxe9v5xcSBnKl0DIBP9k/ckfzC
         RKogYnbbQmUVeVMPa9ynhrZ5C8ENvrPd3t45ZhjtBWhuKqpUFw4IUsyhTH58OpIWBx/1
         feIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789637688; x=1790242488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGegAhrHwlHP92QZ0hz4XHBiZPTgOX1xYugkZhJgZhk=;
        b=Ypsc7Kt1e+4yc+pJ1DuEEFkZE3MZ1eGmPG8VvQZ+YdLtkG48+AIXIGMXUFHod38tBg
         lLNGkpmVl9XDzni20aGCHsoTgaq80FTCi/zQrW5DguZrmpR5yOZ5Gf+PS0Z2S72dRrjk
         8AM8n8rW5rOKzmQzqz6vtjwQsnMvoGtDIJGvbF866NL16th9mTBssAlXUPqIIwC3QmIg
         5JyKd2m+DxexcEWWaVeL42tdgPRboS30CoOmC6KjteteKdS+ipc9MvP1KQkYxWfVMwV0
         9rOyH31wie0bCeRwYfodXidkLbo1uO7U0DbyDnFvWzsSp4qVztDoIVJ8UjvfCqODqy8B
         j6ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXrKrff1d27y7q4BxmhTcpin2/GpEwwBxehUjAOr2GSPc7w+uezAOSNx19++VsB2WbxvYunUq7HLzm@vger.kernel.org
X-Gm-Message-State: AFuF++kvIf7BkhsrCfOzjcZln+/CJBzehpLvp4lUQc5GXLUGfoB7dCMg
	9xarmu7TGzxXYRddmooK/LiYlXVXiI9F+ew3Gv7FVtmrytHtUweZKE6SZAnm6LrK6M2wPeTXcin
	ecZRwrzsBlwY/uAK0QoLBqDUnTXfzXwb9Wee+6N0ez+rjtLPaNRX/OGoPC8EnkqcN
X-Gm-Gg: AYBFou0k8052my3VY8W4UuPfZZqG51LIRkitK5PPlpPKHZdDeNtY/rQBy/qEOe5nTBZ
	BO0OsRDqXx52VWPXynD1zQP0IGQ+LEpN7H6hCtf0qsvuQi97KlK+Ou7dUcFzU8l4JrznnhDi4BQ
	J0ge33joE5dTOgZKeyH2+iOea9tyfFcyJsCtTzmEPBjM8ficQT7IGwb7qJT5eu/MTfGC9oZAfmv
	5KrzpFph9i/Pd2ghHOWOsDhlOPjdH/eGsMelvU/dinsuvoO94WlEQOGEtMyVNxmgTHS1wt6JDN/
	VNN+C/vLb1hiYBkBwBKLJJfWQPo4eBIdY/IuyUkVtIcBj4RMjBpn4gkWFdtEIJnDVSVziE1pN1s
	96Pq91tFehlRrKSctaPsB9uxTnhU=
X-Received: by 2002:a05:620a:6cca:b0:939:5ab4:e6ab with SMTP id af79cd13be357-93bb7667fcemr1037211485a.5.1789637688113;
        Thu, 17 Sep 2026 02:34:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6cca:b0:939:5ab4:e6ab with SMTP id af79cd13be357-93bb7667fcemr1037208885a.5.1789637687747;
        Thu, 17 Sep 2026 02:34:47 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd204d89sm71157115e9.3.2026.09.17.02.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:34:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.3-rc4
Date: Thu, 17 Sep 2026 11:34:41 +0200
Message-ID: <20260917093442.6439-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aabb439 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=P-X_zlnOR8CFjOU9GSIA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Na4UI5wpIL40xbg8h4KsEVZsn4s4kBVq
X-Proofpoint-ORIG-GUID: Na4UI5wpIL40xbg8h4KsEVZsn4s4kBVq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzMCBTYWx0ZWRfXzm2vDJxkCXKe
 hHjX0tkHJvbpZS2goeqURXbEA4zfNm8etXFPuvE3LlHmAxXHRBP6bh0FTVDpfXOIQJmj9H4CRdL
 8O2Y5QIwdEyljFgdPuh8AMGw07vcu+OFPCB8ljqN8shCT6lK2gLYX8JStp6Cq2O0oUV/sZ6lcWP
 R62WCZwv8XCM9RDlg8NepMAhOFw2a3XE8z7XI3UdyIA6gandqYYoqHmh7WQ9E1E2cmWqoHl2+wv
 QzX3pi8noHupPKW3XVsrIxy0zuLfiwMyqWVSBndjiwovnkGYwuV2SaMbD0sxEDX2nAYzCNeSyam
 SJ4b9ArJLTX4Iq2F/JI/XR7jhhcwNQERpltPX3xlu0JbRarQvKgDxL05WXPZ/oB6oFt2Ti/NGvd
 SvV/hykaAxlCa83Yj7Soih5AycDZ4tVvLw1P4lMAxOaehXsuBfEDfKEt/m/hNjH/i+8YGHu+sOa
 69KuqqCYI6/sXdTq6xw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzMCBTYWx0ZWRfXzM1412zkGJyg
 uweHufn6rBUae685Aqcn6MPzrH2uuaZbW9jpRSRnhhWOL76he8UAq6PgPbhLl/f4ckRRJ7BuAtA
 KZiBVsFXXCktUOI2CNDBkzd9V4GEzx0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170130

Linus,

Please pull the following set of GPIO fixes for the next RC.

Thanks,
Bartosz

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.3-rc4

for you to fetch changes up to 50fd0ada8d37587223001600933270b59cb30e19:

  gpio: virtuser: skip free_irq when no IRQ is installed (2026-09-14 10:51:01 +0200)

----------------------------------------------------------------
gpio fixes for v7.3-rc4

- fix fwnode reference leak on failure in shared GPIO handling
- fix regression in OF_POPULATED logic after the unification of GPIO hog
  handling between OF, ACPI and machine variants
- don't call free_irq() if no IRQ is installed in gpio-virtuser

----------------------------------------------------------------
Abdurrahman Hussain (1):
      gpiolib: of: don't mark hog nodes OF_POPULATED before a chip is found

Bartosz Golaszewski (1):
      Merge tag 'v7.3-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-current

Michail Tatas (1):
      gpiolib: Put fwnode reference on failure

Runyu Xiao (1):
      gpio: virtuser: skip free_irq when no IRQ is installed

 drivers/gpio/gpio-virtuser.c  | 3 ++-
 drivers/gpio/gpiolib-of.c     | 6 +++---
 drivers/gpio/gpiolib-shared.c | 9 ++++++---
 3 files changed, 11 insertions(+), 7 deletions(-)
