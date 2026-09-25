Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E3E36EABE
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 14:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345394; cv=none; b=KHmZHZGE8Q7AymDN0SdjJShrOetOk/dSsdYmobxhW7G7DXYOFAREq+Eu5z3PVnmVviIEeyjLDaM9X7QOPuNDrYv8fovmA9mQUcyj29MK1bB5Ao8WQtApvUa+SKDQ1M9/pWbfPfHzbbG4LFa5fmVZ8C1EvDNbyC5SBEsQ7CpPGzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345394; c=relaxed/simple;
	bh=LU7+25bk5o8+N6zuw1WW/2q2xP70c/LUEbs9HOe1hTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c6nyUOiHgDLcPrRbfGcuBxXcpZ3e5rz2jMKQzTUpV+3NVbnJqh5aXwU7sVPCXXNNeFB4xDqjpY7laqhAeVt/7gY3hdsu6uFO2gvUcKCiacM+ak/UX3B7SUltteJMysn0vWShYgb2+dwenHPuiCYbV8LAId+Tkx3EwoF0kFT5yXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHmoDK/R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UfCTKjSX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHmoDK/R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UfCTKjSX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA4DnL609155
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 14:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YDwC0w8YQFvGJrhmVY4MDs
	bKbJz9KVXJ6ZGExYd/pL4=; b=eHmoDK/RQGcZygPnfAPZD+6t2Mrx9917zz3Bkb
	B8DAaK3vl+yiFIX+ihjH/q9Fidvf5LtsIClHxAHRSoM2dzbynjfFzJHPmFTGVs6A
	rVxWfCVuGP8XdmdZCiAyTRoef8PJpHm+4oJav8RFJHUiW80dOglWCsQfArsPy8uE
	NzMLe6vMi+67gaVUS31PTI0SHlbH8qMoZkOBPZ/eQQvrElCMsHvf541psn2kzucv
	GxG/wEa3VVQWIaxV52nwtxWqDvEqtYG1IDxyqbjMjMkvZF5iJSamRW14Yd9rSL/0
	XLFYXGZP2O9/pghLZTLiwDRpp3XoLKZU3gIhS9Vw5Okmn4cA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvnrrau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 14:09:51 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-790e3ca4c85so219122137.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 07:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790345391; x=1790950191; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YDwC0w8YQFvGJrhmVY4MDsbKbJz9KVXJ6ZGExYd/pL4=;
        b=UfCTKjSXO5TOC3vAGJPbpXHKSeI7FULCy0OZCSquUmkax3p4zK8tvbOZYvZdYj+SDF
         SE6r+yKEn4O+yf+ENrcrbpAk7BRCII/NyoodGdMDTPp5Vu+cLyiHoPzGHWgsLObnXCYE
         RGA3ZK9HYtErjKBiqkuWV3YpZuLLtqLOOUJKdf460GNlo56XcMla+IXn0Iyrzh11HjGj
         2cyCLHOKfDWg4fLy93hQspo5jwehFdjDHm3JvCY5UWVPs68G50yf+8x/iaT6Q7IJKZip
         BgRod9g8xiBScXewTxAVSFravRDCXDYvJE7Tgqk6KmPhRch0NQLeyL8q7a1V470aKRDJ
         OYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790345391; x=1790950191;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YDwC0w8YQFvGJrhmVY4MDsbKbJz9KVXJ6ZGExYd/pL4=;
        b=pT0mqcfHDc+GrLEPboLAcXovUaqK0BACr1lS5NAEybQidgk20f6OHhBrIOB3jgucuM
         HHloduxLBxHgKp2/2Y0jKs3gkB/OJ8eyUrP78F66AhfMyvj6uzQCBSfeDB3M8HQICdHe
         IHY9AFrGQnuNPzFLdGuyyPiZ2Czci+iTCTf8vPbn/svYYrYKor0hu4Uhm/P+mibPseyj
         C4AmKvt6mWJ5oynQ9/8L+IoyzJoTpB/FwafdhOelwHPJZ/raAXs6qo4wfuHDHLtm0SzN
         Me5eN/wOMJ6GYYcOLvUJX7gdjV7fdQN/3QbfQPgxCOPfjuxWrlIkBeIzAmPB29fpinpH
         3eZw==
X-Gm-Message-State: AFuF++mUDrwHDYp0nhsThqvmq87FaJZZqC6ZgF1E/o/pyx6OvhOMXHpz
	KoPnGI4s4oTAiQghfoK17C1ckvZH+ZIPUC91uZQqrmHIVCbS38qoEeXlA90yJOzBdejLSL2v92r
	LRPFmAvpqZax7e2RrJ0pThv1tCR2cfuuhBRT2iqhWeH01uWZgVe9H6jCWniruqpE1I/LV98aU
X-Gm-Gg: AYBFou0IRcGrC9hilPToEkisY2ejyDgapDPFLWG+xAB268Bbv/jvyj7KMuKg2rhNKwJ
	I9KKTIYUMtv0baU6FEk5IfLKIYAo8G4uxF/+7L0noY0VG2jo2F9jVlaA+TbFkgIu21Ojr4vYfdS
	e8KG4R7TZu1BfuVcBKlmJJ+BT5P6iVtUTemzOTh2iEF6w+IE+DQD+41iLjUfx5MITszl+JueQs1
	YmtqBYubXnqdvZQkFZavRn7afe/eegxFY/WwmtRmgwb6waiH6NV1pKQNY4cdgypL0YTf99BE2bQ
	E9s7ETQjPhhzbTIBsP+5vg8jzdTOWPJMgC/LKYxQnr+b/BfzlDvv5YzfEkC7Wg3Pe2YCKptIk6B
	LeSxdvtRykiNdEwo9QWFSeN8RKxVV
X-Received: by 2002:a05:6102:160f:b0:7a2:7ccd:280d with SMTP id ada2fe7eead31-7af1b55f9b9mr2623090137.8.1790345390805;
        Fri, 25 Sep 2026 07:09:50 -0700 (PDT)
X-Received: by 2002:a05:6102:160f:b0:7a2:7ccd:280d with SMTP id ada2fe7eead31-7af1b55f9b9mr2623071137.8.1790345390312;
        Fri, 25 Sep 2026 07:09:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bde1:52f9:d7f0:c581])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm7495348f8f.32.2026.09.25.07.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:09:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 16:09:40 +0200
Subject: [PATCH libgpiod] dbus: fix the license of gpiodbus.h
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-libgpiodbus-license-v1-1-d7ddafca8872@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKOAtmoC/zWMQQqAIBAAvxJ7TjCjsr4SHTQ3WwgLlyKQ/p4E3
 WYOMwkYIyHDUCSIeBHTHrJUZQHzaoJHQS47KKla2atGbGT9QbuzJ2eeMTCKGq3W0pjOuAZyeUR
 c6P6uI/wBTM/zAuEX2YZvAAAA
X-Change-ID: 20260925-libgpiodbus-license-3eb880aa7ad5
To: Mark Jonas <mark.jonas@de.bosch.com>,
        Ricardo Simoes <ricardo.simoes@pt.bosch.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LU7+25bk5o8+N6zuw1WW/2q2xP70c/LUEbs9HOe1hTg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqtoCmmT3aSrEqeyhV7mJg2H8h8YsWbwFoLD4M4
 bMagF1P7i2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaraApgAKCRAFnS7L/zaE
 w3AaD/9CdgTGJSAY4Kas7DvvhT3JwIZ+RJ4RPHES5L8Pk+lp9Seav2A72TaPbhfgd9PXgXb2C78
 d8uzsf2tt0lJpOlRe0Ya6aUX2G7P/rXNMc6m2oeft3DIi9oTEY5sL/p0Y2l00DI3XIBVGWiydk1
 2C2hgtuzlk6Z48v9JhZp7uNmSflftriHKbDbD5XjJfVE0RRIYZ4HwFnk7lNTDNTpbH0YppkA070
 rqEgD1rPcwZLMhZSJqVEb4heh4yJ7uiwjuQjTHFUZZXJ/UnqAxz8mvjhCFD9Lu9rwqQbPF26l6Q
 hzI/81KNRqlD1hGdjjRy0/tRlZvC3uGBRKr8tUgLv5xaqVgPPRk+aIKRVuG3k019aRVSomnyU97
 6IxYFRd5uvCVmU8SYqIkdbuVEMA+HOEWGw9D5g/AczbttN8y8rCzmD5QzYDqlidMfp1PW6FvN9C
 4g2stqlWXStNAMsGSnSA8ciJGw+HF2VZy+eEOxhi1pK6nzPEQhYBTJRQFURgVrFYM6Ah+20t71q
 AOLbYzFZ0Rd6GtUm8D3zZ5RWVnfTU4txohXq5g0YTyXGgD4dBRtUTKawgNItlQst2MaGq3aFBy9
 an68fEkQ18QsfqGZkBItYdVENS1lREm4OVg6mK4G9YBposBvz+8grf5wC35uYPFPv6kJkiN6Ulz
 24ArsQMjBIekrlg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: Wdc4Qwc-TX0mgzgkSqI9GNu05E1_--dn
X-Proofpoint-GUID: Wdc4Qwc-TX0mgzgkSqI9GNu05E1_--dn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1NiBTYWx0ZWRfX83W0ZmoQl6PS
 0fBjkhBIZ7rpyl2HyJ40kZvAfjKmAdgQMRpVVIvLGO1wYWDQzvwRDJSxbunpkfdGaWzPl7GXQ0C
 MGGj/s8ZUBYR6MdcqP+WiHV5p1Dpdf0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1NiBTYWx0ZWRfX7ZRTD90sEEKZ
 UOYgGNX/G1PGxRMR9OmOdrAMetmD3ot7bTmmnEOOcN9Yy3cyShEufrVpXPv2AmHQ0Y4NuqJtnsa
 oSQBvC+HYj2vIpbDtaQMoKfY3NsSPzYkd92xCohHfUT3OnziUyK6Xl3QfAKAki3igLH1R+8hPZq
 0LeES/ZLE03jIUiFZoPyn0b7oYHvfSto6ohGDop3oqO2GVmgZs4oPr3rirW1++PQzyBqgMCpxmB
 Zh90ke9HOX/mVh7CDw5fgg7GC6LHL32NAwgdTupTq7XWGFXNXIJtMsOlR2kmtLNLhfmIIbvuvUr
 OQb4CGnnyK/UW7bAaT8F/kF5G4+VIxyaPt+Uxvx9LiElARBXGszlNGrYA3FsG+Gfz/i2RaSQU0K
 iS/FoAkwEjXhg/g404OFqrznz/GeH7BptgNBs30LbqSwB/3PIpuzcf6qny1IJJNMyqTyUwseIa0
 MLo6tuLQmjCu9YrKpNQ==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab680af cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=BxCBiSr9KnWAp5bQWooA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250056

The libgpiodbus library - which is entirely automatically generated with
gdbus-codegen - was meant to be available under LGPLv2.1 like all the
other shared libraries in this project. Change the SPDX tag in that
file to LGPL-2.1-or-later.

Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client and tests")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Mark, Ricardo: please feel free to include this commit with
Upstream-Status: Backport in your meta-openembedded series and change
the license of libgpiodbus in your patch to LGPL-v2.1.
---
 dbus/lib/gpiodbus.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dbus/lib/gpiodbus.h b/dbus/lib/gpiodbus.h
index 025c9c8586818051719078ba9d240f6d8b39e016..7557a576a5e9c6703ef78054ddc62a8b270de422 100644
--- a/dbus/lib/gpiodbus.h
+++ b/dbus/lib/gpiodbus.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
 
 #ifndef __GPIODBUS_H__

---
base-commit: 64fde2647ddaa9446491543c697d26e94e03363e
change-id: 20260925-libgpiodbus-license-3eb880aa7ad5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

