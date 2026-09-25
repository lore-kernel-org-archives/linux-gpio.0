Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D643AFD1E
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 10:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331751; cv=none; b=FJkgZ+ihAgpkwFo8ANv7EAGUiXWNUUoK/JNfigjf7kJu0GjvhucRMnuIIaTGZQ+wQYk8+ZTlTXuqQTFjCFF/R22RUYPCfD1tPdmQ5m09nny1yUJjvRXlPc5bxPiIbGnl+aOeMsYqpjORclFcF82sdKfWpfoctyKUvfaPN9OUYA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331751; c=relaxed/simple;
	bh=nqnQLBKHno6gKYYM9XNFtLYJdRGkVDekf39b8GX99v8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ggl6by6vfhTXvWv1kJFXtcE6sgr2TperA2GuBR0M2pYBMsnpICNeyvBAQO/3vw+s14EYvmD1HFAq2alZbJXLotmgEE9oZfTOfmk3tEKJj26O13DZcb442cLtTr3oXedbAkC/BsZxnVwnSnF6atBgis5zpuUgi4bzlacPOUEZr8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mbJjYkt3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kZV/ijtO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbJjYkt3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kZV/ijtO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Z6gZ1056551
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 10:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uyQKB1E62YP/fNu85EfC3+
	zQYXWoAArsTWIrAThf3xc=; b=mbJjYkt3DoofdNu6j5tZeBFLB50HWnGZSaIAGi
	q7LwkM39c3QzVDhBXQWA+XR+dAPKUhJPN+20qvacqNFN5BrcJeSqLSJ13dSWD9Fu
	zJSIG4b7/I9u0GjSZEm5Ul2qasv/ph6wcYEYRi1gHZNnYWFYSjv/pvwt9i/aaKDA
	HLWgCnZfLqcG8wWDaYFiye37vb4BgBnRRL78irZ66EeWABmTQlTR8PjCwVW+8hvd
	9u3nR8np3CPxQwwXxjS3aJ5MCiapWg6+s1q06UzeyINBJjMoLmODlwIPWsS/XbtS
	48u24Ru/NjXvvenXTK3I5YTvik/dCqT9TvSCbgG1t4c2p4ug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce7a058-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 10:22:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1de6d5c3so167990285a.3
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 03:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331748; x=1790936548; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uyQKB1E62YP/fNu85EfC3+zQYXWoAArsTWIrAThf3xc=;
        b=kZV/ijtOuSOaEaEUGvO88b6N3uuFAvLXOPOD9Jw357zWDFXAqeSwh+fRWW2H6FGT8V
         nAAlcqmD74kmwa5lbyFZnlPlLJZ69MArqqghhGa8pi8GD6wpPys23sSxxHLVN5mGDnJD
         +mXfDKlZ8lSe9dfiwimrCVOQ7BHKQ/47fS2tVlbe0p0y2Hbm99a/qEg4icy9fvJ18YKS
         ihuB7Rr280brbBB8mRVR7e8Wr4fqaeGBHn2tsf+KEUgUcudXQRgeiW0Ta1X4nfcDafOC
         jQv5Nnz0X1YjtRfNxkQOVk6Q6nsI9jE19RwudOZlBeKeDbqHr3lysLLXmPjvQAHhyTZB
         9K4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331748; x=1790936548;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uyQKB1E62YP/fNu85EfC3+zQYXWoAArsTWIrAThf3xc=;
        b=BeFeWsz+biNNQ73/omASHpgwi1VxRQPLSivgffufs/AuTMvIGVDgOeqYAo4dliE/VA
         RUBr1t7U8nBCAmRvhAL57HrODEoadIO63Ff9Bmn6SjTQbYEzDOuXh0q/RhLli9utJJoT
         z2Lt+X+0HbvFYZUYwGYl/5d4hDRGofovCFxotWStEn4NWIsICmwkCgDVIx65xc+G9pWp
         O/7FD3YErmmQuzQiZP/6YlgWo1P5Jk4eugu0vwuqDOra1qKwwuNqgM8hqC2m455oX8l6
         sQhN0qoSwH3YdjOUjU/3U7jXdFtaWNjTAmWzHDOi2HW/hAi2scl7HF7Gbu3s/wW5zntb
         3hZg==
X-Forwarded-Encrypted: i=1; AKwUvBwgcvvdumBhMM0SgAU7EOqACtLdxg0/r4sltIW0FdsOHlB/0CbA3S4IgKAcKp9Vpo8Vp/W9HzOBsMz7@vger.kernel.org
X-Gm-Message-State: AFuF++l7sMEJP4r5qh9o2nm6OJehNqcXbAY5KP6fkCUiALwM0vneRZJI
	KJ22Yi1YFe6h3pwCWl3Iict2iNAbqCVRFNcjgd1VEXx2+pK3cvn8Sfq5bGNWOMp/2YXoTncjiw3
	NBUqIu4fgqmz92vq0fngvKOnzYO87jPdpe3ckcsWiPrPeEXKkXXaN5evZFBzktyn7kV4DjcRO
X-Gm-Gg: AYBFou3/09nS4f1CrObnqVoubC98tLqHI/Br1dEWn76k3iPQ28G0dlz/C1HwK6Ixbg6
	qGreq+V1U4BqfDrHXshyrLpyJ2DdQI+0qWk3jvfdVTZu84WAdnVRzoa47pGRKpZ1w0F7T5vkVic
	oKmtDBYveHUBgBhnocYWynFsDEEe/XDULmXqVsQUo7v73acdND2MaaVBqU5i5iutZtaPg6a2+uU
	19mar7WZoowe+WBM3X2erAJNw8n1NJ1Z8rr9eZrecCNjY+0xsm1mVJIkepsRJupbVD3oWmRN53L
	ZP7m+tc7c89zrm0je6mlrx3rbdcVVb/T0AyOMrBiJUuOvNP6v2FAZyTCZh0WqI7tEyluXxAP+6d
	H7AGQZ0wae29izpaYXQEdBHt7pGBB
X-Received: by 2002:a05:620a:468c:b0:92e:5d44:73fc with SMTP id af79cd13be357-93c43cc5819mr362648385a.12.1790331747591;
        Fri, 25 Sep 2026 03:22:27 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:92e:5d44:73fc with SMTP id af79cd13be357-93c43cc5819mr362643185a.12.1790331747067;
        Fri, 25 Sep 2026 03:22:27 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bde1:52f9:d7f0:c581])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef4fc959sm55071025e9.2.2026.09.25.03.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:22:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 12:22:15 +0200
Subject: [PATCH RFC] gpio: move intel drivers into their own directory
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFZLtmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNT3fSCzHzd/KL0xLzMqlTdpErdstS8lPwi3WRjixRjk8RU09RkUyW
 g7oKi1LTMCrDJ0UpBbs5KsbW1AC14S0duAAAA
X-Change-ID: 20260925-gpio-organize-by-vendor-c38d34ae5ec5
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>,
        Lixu Zhang <lixu.zhang@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
        Mika Westerberg <westeri@kernel.org>,
        Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
        Hans de Goede <hansg@kernel.org>,
        Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13804;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nqnQLBKHno6gKYYM9XNFtLYJdRGkVDekf39b8GX99v8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqtktcC5sP4GMuwIWei1QK1DpxwZKuxHJVfJhWl
 Y8egUIAHsWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarZLXAAKCRAFnS7L/zaE
 w2iUD/90qG0u87l/DwcK7lgRhvor02QAWz1h3Sf/7PnUGJXGj/9ech4eGk8CbaJNIuuMUAn9PoY
 EF+zELX2OPq3QEzLgbUHgG2vjpvEB2QG+YeGGkGvIajHoJnp3wcztzekqcGc19P/oZ2KVLWJ5/c
 Ny74jE8q+1v8YAYXwEZ80nEUKd+Qt/OcLvtYenU68t/6yeXk2oI52pvIQgvLmXMpsOOmEiqq/Kd
 HUMPOkpLSz6PIUXRBYrTaEUnmYcIAps1MxNDFjqWkZKOwrAx6Ff54YDfTeKyN2hs4vyfhD/bkkz
 Mm++OftjRGr22ZoSZe/7HVSk6DXGxfyM/H4bdUpgwRmQSY9KmxiwkwcuXdoaSMktvxrWVXbc2wM
 stwRIXPd7/4YF/Gf+m+wT35mpi41BCK0Mu+YXahTXXBSHcVZs2avHB0Uiu7EQ3ySIHxvQhdK88i
 irCE0fNz8aaCu+7cV/mosi/kJE0/EufD/tqazv7f1BJIMSUldDqdnl0pWIj34v6C7UwE2O73KRt
 E5h6QHfwOEb6xBZRxj1ud8j79Ee8QYfFoyAdGl2KkxevCF9XvrmHAf9bFPSOjjrY3jHaWfJ5xza
 LRrlAqTSQmbyZQPtB44zZboNKFy7tADoEylrCaJbJNQxEx8A0lti6pFtxgM/6PMkNVn4ccA3EDl
 asjGdzk8/hL2ktA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: yYxhV32IbXUmApOQB5CK6kNSkHB-1m6J
X-Proofpoint-ORIG-GUID: yYxhV32IbXUmApOQB5CK6kNSkHB-1m6J
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab64b64 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=Byx-y9mGAAAA:8
 a=XwzLNDupwSXTBgz851UA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX9z+El/7i+Dpl
 7qYsnbgrzWK2fdL3BB8OyU/FpgasKIhQyligkq0MRKtvtpn27baOouVxGMQGVolqxQh1fewbPaV
 HDn6cIggDniDVD0/ig8GlysjZOrMYJFKKe61JJqcYc6MHNtFqrUhAe8HAU9M/t6DXkJztdKjwKW
 JpbLsn8UoU7LxTFMT/OMg8mQTgGpQgKaVOmoBbQpzxt+6ImP1iau37HyDX9JwIWVY6GihovthOr
 6os5HxPMnifmpn3FA6clEeVbWj9IgyKp6mhygegVthfd+fztyInmcJ0ysLbJju6YunJpjNKpbGw
 QAU08BPiRlUFqE7W6JOG3OIPdsDR0kL7Susroa3Seqw4HRU2+VsihPe37ZGezD6p0Vjt95ggyd3
 qROVSth+XfnKjVQWsqk8CeRlTNcqZXHTPresQCfDtvtSiX5P37aeHTZ1mWbc9yj8krjC3AvRIQu
 MzkzMG10UEOH0/DZRhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfXxKPb9XscSMNZ
 VSRTj8UgzISNnRR8m0n5OWoDE6tvRyp20rh4q1Yhn5GKM8eRooPxZnMZd1mIq5dafeGQNFATLEH
 4gzet22FVVQk/f/KXyXYClb4OHWaX9E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250041

In order to avoid maintainer mistakes on patch ownership: move all the
Intel drivers into their own dedicated directory under
drivers/gpio/intel. Don't touch Kconfig options as we historically sort
GPIO drivers by type, not by vendor.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
I've repeatedly been queuing patches that are Intel GPIO maintainers'
territory becuase I don't rememember all the intel GPIO driver names. In
order to avoid such mistakes in the future, I'm proposing to move Intel
drivers into their own directory. Other vendors may follow.

I wasn't sure about gpio-ixp4xx.c and gpio-pxa.c, let me know if they
should go in there as well.
---
 MAINTAINERS                                     | 29 +++++++++++++------------
 drivers/gpio/Makefile                           | 17 +++------------
 drivers/gpio/intel/Makefile                     | 16 ++++++++++++++
 drivers/gpio/{ => intel}/gpio-crystalcove.c     |  0
 drivers/gpio/{ => intel}/gpio-elkhartlake.c     |  0
 drivers/gpio/{ => intel}/gpio-graniterapids.c   |  0
 drivers/gpio/{ => intel}/gpio-ich.c             |  0
 drivers/gpio/{ => intel}/gpio-ljca.c            |  0
 drivers/gpio/{ => intel}/gpio-merrifield.c      |  0
 drivers/gpio/{ => intel}/gpio-ml-ioh.c          |  0
 drivers/gpio/{ => intel}/gpio-novalake-events.c |  0
 drivers/gpio/{ => intel}/gpio-pch.c             |  0
 drivers/gpio/{ => intel}/gpio-sch.c             |  0
 drivers/gpio/{ => intel}/gpio-sodaville.c       |  0
 drivers/gpio/{ => intel}/gpio-tangier.c         |  0
 drivers/gpio/{ => intel}/gpio-tangier.h         |  0
 drivers/gpio/{ => intel}/gpio-usbio.c           |  0
 drivers/gpio/{ => intel}/gpio-wcove.c           |  0
 18 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9765e8a72dc78a8f2aee6a6f00f7b5f729b1f457..e68cb1774f8c93facf9e18167d8a45ce941a68b1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13292,23 +13292,24 @@ M:	Andy Shevchenko <andy@kernel.org>
 L:	linux-gpio@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
-F:	drivers/gpio/gpio-elkhartlake.c
-F:	drivers/gpio/gpio-graniterapids.c
-F:	drivers/gpio/gpio-ich.c
-F:	drivers/gpio/gpio-merrifield.c
-F:	drivers/gpio/gpio-ml-ioh.c
-F:	drivers/gpio/gpio-pch.c
-F:	drivers/gpio/gpio-sch.c
-F:	drivers/gpio/gpio-sodaville.c
-F:	drivers/gpio/gpio-tangier.c
-F:	drivers/gpio/gpio-tangier.h
+F:	drivers/gpio/intel/gpio-crystalcove.c
+F:	drivers/gpio/intel/gpio-elkhartlake.c
+F:	drivers/gpio/intel/gpio-graniterapids.c
+F:	drivers/gpio/intel/gpio-ich.c
+F:	drivers/gpio/intel/gpio-merrifield.c
+F:	drivers/gpio/intel/gpio-ml-ioh.c
+F:	drivers/gpio/intel/gpio-pch.c
+F:	drivers/gpio/intel/gpio-sch.c
+F:	drivers/gpio/intel/gpio-sodaville.c
+F:	drivers/gpio/intel/gpio-tangier.c
+F:	drivers/gpio/intel/gpio-tangier.h
 
 INTEL GPIO GPE DRIVER
 M:	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
 R:	Mika Westerberg <westeri@kernel.org>
 L:	linux-gpio@vger.kernel.org
 S:	Supported
-F:	drivers/gpio/gpio-novalake-events.c
+F:	drivers/gpio/intel/gpio-novalake-events.c
 
 INTEL GVT-g DRIVERS (Intel GPU Virtualization)
 R:	Zhenyu Wang <zhenyuw.linux@gmail.com>
@@ -13475,7 +13476,7 @@ INTEL LA JOLLA COVE ADAPTER (LJCA) USB I/O EXPANDER DRIVERS
 M:	Lixu Zhang <lixu.zhang@intel.com>
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 S:	Maintained
-F:	drivers/gpio/gpio-ljca.c
+F:	drivers/gpio/intel/gpio-ljca.c
 F:	drivers/i2c/busses/i2c-ljca.c
 F:	drivers/spi/spi-ljca.c
 F:	drivers/usb/misc/usb-ljca.c
@@ -13709,7 +13710,7 @@ M:	Israel Cepeda <israel.a.cepeda.lopez@intel.com>
 M:	Hans de Goede <hansg@kernel.org>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
 S:	Maintained
-F:	drivers/gpio/gpio-usbio.c
+F:	drivers/gpio/intel/gpio-usbio.c
 F:	drivers/i2c/busses/i2c-usbio.c
 F:	drivers/usb/misc/usbio.c
 F:	include/linux/usb/usbio.h
@@ -29736,7 +29737,7 @@ WHISKEYCOVE PMIC GPIO DRIVER
 M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
-F:	drivers/gpio/gpio-wcove.c
+F:	drivers/gpio/intel/gpio-wcove.c
 
 WHWAVE RTC DRIVER
 M:	Dianlong Li <long17.cool@163.com>
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index ce56e9b3f55d62d077ff69a2e1f68ee229b55204..03059fcb066180d79032dde8b9cb5443857e6536 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # generic gpio support: platform drivers, dedicated expander chips, etc
 
-ccflags-$(CONFIG_DEBUG_GPIO)	+= -DDEBUG
+subdir-ccflags-$(CONFIG_DEBUG_GPIO)	+= -DDEBUG
 
 obj-$(CONFIG_GPIOLIB)		+= gpiolib.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-devres.o
@@ -56,7 +56,6 @@ obj-$(CONFIG_GPIO_CGBC)			+= gpio-cgbc.o
 obj-$(CONFIG_GPIO_CLPS711X)		+= gpio-clps711x.o
 obj-$(CONFIG_GPIO_SNPS_CREG)		+= gpio-creg-snps.o
 obj-$(CONFIG_GPIO_CROS_EC)		+= gpio-cros-ec.o
-obj-$(CONFIG_GPIO_CRYSTAL_COVE)		+= gpio-crystalcove.o
 obj-$(CONFIG_GPIO_CS5535)		+= gpio-cs5535.o
 obj-$(CONFIG_GPIO_DA9052)		+= gpio-da9052.o
 obj-$(CONFIG_GPIO_DA9055)		+= gpio-da9055.o
@@ -65,7 +64,6 @@ obj-$(CONFIG_GPIO_DLN2)			+= gpio-dln2.o
 obj-$(CONFIG_GPIO_DS4520)		+= gpio-ds4520.o
 obj-$(CONFIG_GPIO_DWAPB)		+= gpio-dwapb.o
 obj-$(CONFIG_GPIO_EIC_SPRD)		+= gpio-eic-sprd.o
-obj-$(CONFIG_GPIO_ELKHARTLAKE)		+= gpio-elkhartlake.o
 obj-$(CONFIG_GPIO_EM)			+= gpio-em.o
 obj-$(CONFIG_GPIO_EN7523)		+= gpio-en7523.o
 obj-$(CONFIG_GPIO_EP93XX)		+= gpio-ep93xx.o
@@ -75,14 +73,12 @@ obj-$(CONFIG_GPIO_FTGPIO010)		+= gpio-ftgpio010.o
 obj-$(CONFIG_GPIO_FXL6408)		+= gpio-fxl6408.o
 obj-$(CONFIG_GPIO_GE_FPGA)		+= gpio-ge.o
 obj-$(CONFIG_GPIO_GPIO_MM)		+= gpio-gpio-mm.o
-obj-$(CONFIG_GPIO_GRANITERAPIDS)	+= gpio-graniterapids.o
 obj-$(CONFIG_GPIO_GRGPIO)		+= gpio-grgpio.o
 obj-$(CONFIG_GPIO_GW_PLD)		+= gpio-gw-pld.o
 obj-$(CONFIG_GPIO_HISI)                 += gpio-hisi.o
 obj-$(CONFIG_GPIO_HLWD)			+= gpio-hlwd.o
 obj-$(CONFIG_HTC_EGPIO)			+= gpio-htc-egpio.o
 obj-$(CONFIG_GPIO_I8255)		+= gpio-i8255.o
-obj-$(CONFIG_GPIO_ICH)			+= gpio-ich.o
 obj-$(CONFIG_GPIO_IDIO_16)		+= gpio-idio-16.o
 obj-$(CONFIG_GPIO_IDT3243X)		+= gpio-idt3243x.o
 obj-$(CONFIG_GPIO_IMX_SCU)		+= gpio-imx-scu.o
@@ -92,7 +88,6 @@ obj-$(CONFIG_GPIO_JANZ_TTL)		+= gpio-janz-ttl.o
 obj-$(CONFIG_GPIO_KEMPLD)		+= gpio-kempld.o
 obj-$(CONFIG_GPIO_LATCH)		+= gpio-latch.o
 obj-$(CONFIG_GPIO_LINE_MUX)		+= gpio-line-mux.o
-obj-$(CONFIG_GPIO_LJCA) 		+= gpio-ljca.o
 obj-$(CONFIG_GPIO_LOGICVC)		+= gpio-logicvc.o
 obj-$(CONFIG_GPIO_LOONGSON1)		+= gpio-loongson1.o
 obj-$(CONFIG_GPIO_LOONGSON)		+= gpio-loongson.o
@@ -117,8 +112,6 @@ obj-$(CONFIG_GPIO_MAX77759)		+= gpio-max77759.o
 obj-$(CONFIG_GPIO_MB86S7X)		+= gpio-mb86s7x.o
 obj-$(CONFIG_GPIO_MC33880)		+= gpio-mc33880.o
 obj-$(CONFIG_GPIO_MENZ127)		+= gpio-menz127.o
-obj-$(CONFIG_GPIO_MERRIFIELD)		+= gpio-merrifield.o
-obj-$(CONFIG_GPIO_ML_IOH)		+= gpio-ml-ioh.o
 obj-$(CONFIG_GPIO_MLXBF)		+= gpio-mlxbf.o
 obj-$(CONFIG_GPIO_MLXBF2)		+= gpio-mlxbf2.o
 obj-$(CONFIG_GPIO_MLXBF3)		+= gpio-mlxbf3.o
@@ -135,7 +128,6 @@ obj-$(CONFIG_GPIO_MXC)			+= gpio-mxc.o
 obj-$(CONFIG_GPIO_MXS)			+= gpio-mxs.o
 obj-$(CONFIG_GPIO_NCT6694)		+= gpio-nct6694.o
 obj-$(CONFIG_GPIO_NOMADIK)		+= gpio-nomadik.o
-obj-$(CONFIG_GPIO_NOVALAKE)		+= gpio-novalake-events.o
 obj-$(CONFIG_GPIO_NPCM_SGPIO)		+= gpio-npcm-sgpio.o
 obj-$(CONFIG_GPIO_OCTEON)		+= gpio-octeon.o
 obj-$(CONFIG_GPIO_OMAP)			+= gpio-omap.o
@@ -143,7 +135,6 @@ obj-$(CONFIG_GPIO_PALMAS)		+= gpio-palmas.o
 obj-$(CONFIG_GPIO_PCA953X)		+= gpio-pca953x.o
 obj-$(CONFIG_GPIO_PCA9570)		+= gpio-pca9570.o
 obj-$(CONFIG_GPIO_PCF857X)		+= gpio-pcf857x.o
-obj-$(CONFIG_GPIO_PCH)			+= gpio-pch.o
 obj-$(CONFIG_GPIO_PCIE_IDIO_24)		+= gpio-pcie-idio-24.o
 obj-$(CONFIG_GPIO_PCI_IDIO_16)		+= gpio-pci-idio-16.o
 obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
@@ -166,21 +157,18 @@ obj-$(CONFIG_GPIO_RTD1625)		+= gpio-rtd1625.o
 obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
 obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
-obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
 obj-$(CONFIG_GPIO_SHARED_PROXY)		+= gpio-shared-proxy.o
 obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
 obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
 obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
 obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
 obj-$(CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER) += gpio-sloppy-logic-analyzer.o
-obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
 obj-$(CONFIG_GPIO_SPACEMIT_K1)		+= gpio-spacemit-k1.o
 obj-$(CONFIG_GPIO_SPEAR_SPICS)		+= gpio-spear-spics.o
 obj-$(CONFIG_GPIO_SPRD)			+= gpio-sprd.o
 obj-$(CONFIG_GPIO_STMPE)		+= gpio-stmpe.o
 obj-$(CONFIG_GPIO_STP_XWAY)		+= gpio-stp-xway.o
 obj-$(CONFIG_GPIO_SYSCON)		+= gpio-syscon.o
-obj-$(CONFIG_GPIO_TANGIER)		+= gpio-tangier.o
 obj-$(CONFIG_GPIO_TB10X)		+= gpio-tb10x.o
 obj-$(CONFIG_GPIO_TC3589X)		+= gpio-tc3589x.o
 obj-$(CONFIG_GPIO_TEGRA186)		+= gpio-tegra186.o
@@ -211,7 +199,6 @@ obj-$(CONFIG_GPIO_VISCONTI)		+= gpio-visconti.o
 obj-$(CONFIG_GPIO_VX855)		+= gpio-vx855.o
 obj-$(CONFIG_GPIO_WAVESHARE_DSI_TOUCH)	+= gpio-waveshare-dsi.o
 obj-$(CONFIG_GPIO_WCD934X)		+= gpio-wcd934x.o
-obj-$(CONFIG_GPIO_WHISKEY_COVE)		+= gpio-wcove.o
 obj-$(CONFIG_GPIO_WINBOND)		+= gpio-winbond.o
 obj-$(CONFIG_GPIO_WM831X)		+= gpio-wm831x.o
 obj-$(CONFIG_GPIO_WM8350)		+= gpio-wm8350.o
@@ -226,3 +213,5 @@ obj-$(CONFIG_GPIO_XTENSA)		+= gpio-xtensa.o
 obj-$(CONFIG_GPIO_ZEVIO)		+= gpio-zevio.o
 obj-$(CONFIG_GPIO_ZYNQ)			+= gpio-zynq.o
 obj-$(CONFIG_GPIO_ZYNQMP_MODEPIN)	+= gpio-zynqmp-modepin.o
+
+obj-y					+= intel/
diff --git a/drivers/gpio/intel/Makefile b/drivers/gpio/intel/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..b1dc40f21f4b33e33522acaefd2dd4adbd6c0f00
--- /dev/null
+++ b/drivers/gpio/intel/Makefile
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_GPIO_CRYSTAL_COVE)		+= gpio-crystalcove.o
+obj-$(CONFIG_GPIO_ELKHARTLAKE)		+= gpio-elkhartlake.o
+obj-$(CONFIG_GPIO_GRANITERAPIDS)	+= gpio-graniterapids.o
+obj-$(CONFIG_GPIO_ICH)			+= gpio-ich.o
+obj-$(CONFIG_GPIO_LJCA)			+= gpio-ljca.o
+obj-$(CONFIG_GPIO_MERRIFIELD)		+= gpio-merrifield.o
+obj-$(CONFIG_GPIO_ML_IOH)		+= gpio-ml-ioh.o
+obj-$(CONFIG_GPIO_NOVALAKE)		+= gpio-novalake-events.o
+obj-$(CONFIG_GPIO_PCH)			+= gpio-pch.o
+obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
+obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
+obj-$(CONFIG_GPIO_TANGIER)		+= gpio-tangier.o
+obj-$(CONFIG_GPIO_USBIO)		+= gpio-usbio.o
+obj-$(CONFIG_GPIO_WHISKEY_COVE)		+= gpio-wcove.o
diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/intel/gpio-crystalcove.c
similarity index 100%
rename from drivers/gpio/gpio-crystalcove.c
rename to drivers/gpio/intel/gpio-crystalcove.c
diff --git a/drivers/gpio/gpio-elkhartlake.c b/drivers/gpio/intel/gpio-elkhartlake.c
similarity index 100%
rename from drivers/gpio/gpio-elkhartlake.c
rename to drivers/gpio/intel/gpio-elkhartlake.c
diff --git a/drivers/gpio/gpio-graniterapids.c b/drivers/gpio/intel/gpio-graniterapids.c
similarity index 100%
rename from drivers/gpio/gpio-graniterapids.c
rename to drivers/gpio/intel/gpio-graniterapids.c
diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/intel/gpio-ich.c
similarity index 100%
rename from drivers/gpio/gpio-ich.c
rename to drivers/gpio/intel/gpio-ich.c
diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/intel/gpio-ljca.c
similarity index 100%
rename from drivers/gpio/gpio-ljca.c
rename to drivers/gpio/intel/gpio-ljca.c
diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/intel/gpio-merrifield.c
similarity index 100%
rename from drivers/gpio/gpio-merrifield.c
rename to drivers/gpio/intel/gpio-merrifield.c
diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/intel/gpio-ml-ioh.c
similarity index 100%
rename from drivers/gpio/gpio-ml-ioh.c
rename to drivers/gpio/intel/gpio-ml-ioh.c
diff --git a/drivers/gpio/gpio-novalake-events.c b/drivers/gpio/intel/gpio-novalake-events.c
similarity index 100%
rename from drivers/gpio/gpio-novalake-events.c
rename to drivers/gpio/intel/gpio-novalake-events.c
diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/intel/gpio-pch.c
similarity index 100%
rename from drivers/gpio/gpio-pch.c
rename to drivers/gpio/intel/gpio-pch.c
diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/intel/gpio-sch.c
similarity index 100%
rename from drivers/gpio/gpio-sch.c
rename to drivers/gpio/intel/gpio-sch.c
diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/intel/gpio-sodaville.c
similarity index 100%
rename from drivers/gpio/gpio-sodaville.c
rename to drivers/gpio/intel/gpio-sodaville.c
diff --git a/drivers/gpio/gpio-tangier.c b/drivers/gpio/intel/gpio-tangier.c
similarity index 100%
rename from drivers/gpio/gpio-tangier.c
rename to drivers/gpio/intel/gpio-tangier.c
diff --git a/drivers/gpio/gpio-tangier.h b/drivers/gpio/intel/gpio-tangier.h
similarity index 100%
rename from drivers/gpio/gpio-tangier.h
rename to drivers/gpio/intel/gpio-tangier.h
diff --git a/drivers/gpio/gpio-usbio.c b/drivers/gpio/intel/gpio-usbio.c
similarity index 100%
rename from drivers/gpio/gpio-usbio.c
rename to drivers/gpio/intel/gpio-usbio.c
diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/intel/gpio-wcove.c
similarity index 100%
rename from drivers/gpio/gpio-wcove.c
rename to drivers/gpio/intel/gpio-wcove.c

---
base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
change-id: 20260925-gpio-organize-by-vendor-c38d34ae5ec5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

