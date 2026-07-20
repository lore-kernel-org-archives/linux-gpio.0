Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83D738E8CE
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535351; cv=none; b=kBuO+iYIHALIcmC+Ax4rhTvuE88I6OWrRISvz7ArkOua1b0HazzJdZSGitW3HajE1QokQCqbTDZQOBaHXUH5NXYyPQQbk5mKC3TWz4E2zxm/q24vl8eQSeO6KlQyLlHAmHCGUYu0NFBsqEW4xRjNwMSIXrr7odgACbRgpUEk4CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535351; c=relaxed/simple;
	bh=DDexrfwDu5NHvITG0Ha+OqED6iW+uYW8OD8CSPT8D4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sPygnNiCeqcTc+J3UTZnpI5SfY8o2ZcgJULqPQsEaDZIcmmMu0ljQX+LZxwIvtHTnxc8vggqIaw8mHvdVLInzTUKkAd0K78enDQ6VL0YzJFUnd3VP30AsDqmjGRZS7M6GK3JLETcB24nuqOQMfabDuD/VUDtrG9UyOZdmV2tBJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KxiPYwcD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bu8dQn74; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KxiPYwcD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bu8dQn74"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K87Pp02000630
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 08:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9BUymYFjHNyrDMWj/vciAW
	a7eQbYWD1gLsiE8o9DW/4=; b=KxiPYwcDuybAVpaMkNbzoDqQyEv3/nK9AUlp6L
	BDSk7P6ozdDVXE8EG9TtfslXZuYtZr1jsFO3po7WYY6cNgCxpQ1YHEP62Xw+SfMj
	wjOM8C/8el/4B3La9Gmp8/ndoTfwNHXvZZSfTPP3NPxe6IQMlfmo/tgyygoIwgx6
	CAEKTZAR2KQQRSpV7Wk/NdNAt8UT9HV2s6Cishsh6HLjgN16RNbOUh9EctqSmHl1
	3yus9pSSdUd442ChEZiY3taSN12GO36XgyJ7gGSSpfdo7kml7/hv9riW9iq3fBy6
	ydj/JeTcRegBFJ9lU0JhhxtWOOcpmPqIh7KBkojBOVx/Nt4A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxg13e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 08:15:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c07f25de2so90532851cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 01:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535348; x=1785140148; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9BUymYFjHNyrDMWj/vciAWa7eQbYWD1gLsiE8o9DW/4=;
        b=bu8dQn74WDu9hHLp8Ys17VU7jaUFMqG1MQs751GRKIwDIO4p/ZXa0sCVxGPIf2vP5m
         ruOjLdc1YnFXygdA6NQv5FEl0DuRzcgxzTcRMD3oqWcapbcG1hJmOZR6zcs/OrvjT6CT
         mLtW1FImbnb6UdGzy1iC1wetjnBx+PzaKelNKw6VR08HIqEpmxF1j5uXEEmA8EifuLk6
         NwdxnM7T4Vvo3FB3OPtNtHXiPzH53gBIPRdJAh2XxemXKPOC9rR82ynVeXLnl13syNTH
         7ZC6zUJTL6rU4qvrbyB8BTcToNuzPOX/fbqwVHDCpAEtUHwIEi2+73NdyY2ohSdyrb7j
         eh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535348; x=1785140148;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9BUymYFjHNyrDMWj/vciAWa7eQbYWD1gLsiE8o9DW/4=;
        b=PHempulOFAV8Tk4M3lkXpPskl7JSBPBEvu/2RoI/Li/itUdCeq/dlBQM1j8CTNjYaR
         fS6faa06Z4VhAZgEBxYNGCtwCqrrXh9VcmYvsW6nKrjcTlzmXve++uaB5XAEsCrYSf97
         bpeZk1rSoD0KlE6FmaPWi1TyhfEya5H6wdopSAbs2z4m7z+q1jhLTjKjntGX0JEAPukb
         4IlzjBxjUI/bXW/OFsES6OJ1WyDUQGJtn6bjUHdmJkswUTxebIYWzcpOghwaiQVQR/My
         ZFbmUwcswOhiS0MnOK5giU4CtMy8LB+Nvb6Xuhb+s2DVABFCoSwjh8ldwc+1kM17zNGJ
         zN3g==
X-Forwarded-Encrypted: i=1; AHgh+RqrYYMVNz29IGcdRh1elaXsBlfZMd25C3zo0gYFzRYtUd9YN16mpkS9L9oxt13itNQjq/zNysWF9h5N@vger.kernel.org
X-Gm-Message-State: AOJu0YyXXyh7cIMuD0pSMdOBVGcbQ0hipcYNLXKJPB9q+QLtKhkoXuMT
	Kl94CJxBc03D3TEy0ypedXl6prsQd13aqQu0mjQ8abcFbjJMxcs/GFOrCPEwPAg+ZzIzu1sv5BW
	APlLTzOtNW3eY7jpcV/SQ7fFpxWvTilw4nWjEzT8IkEgVYCG8nqlksfADKi1/eMpO
X-Gm-Gg: AfdE7cnVUA1PsTLY6qh0KUAzf8GdC4RSC+VGjl5FqDZS9qZYYlIZNhlZN8I7LZVbnkt
	4dE9ewRGqE+kyO+aUNs8nBIJxV/zoNzC5j2+J+7AAoZiiHlcrO+3lfxoUSSwq7uMibD0WNPdSv9
	YmJqVTM1hNS/xVll36P/Zfi3IUVMkNQwxGyfWGzwvi2PjCg+2L8kbqYwSsTSqB31h1WZmGRHQZ0
	Jbg1SqqZ3coPIyyct1P2BfCRNHiY1vWcDOugA6D9FwhtaPGiy9/8hUwgCZ5Nq/SvG9k5/sif+Iz
	2h7Bo2lTcyGB/gzgNkAmGEaBtLs5BUJ7OHOIE+e9iw+OokvWaiHfz10Wm47D15riRxh9kUezENq
	FTuBVAeazTi2ZK2EX0/si9FSxtBle5A==
X-Received: by 2002:ac8:5f4f:0:b0:517:c65c:488b with SMTP id d75a77b69052e-52137df1584mr117539211cf.0.1784535347886;
        Mon, 20 Jul 2026 01:15:47 -0700 (PDT)
X-Received: by 2002:ac8:5f4f:0:b0:517:c65c:488b with SMTP id d75a77b69052e-52137df1584mr117539071cf.0.1784535347344;
        Mon, 20 Jul 2026 01:15:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:65fa:60cb:c205:d511])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49548e02043sm247375255e9.1.2026.07.20.01.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:15:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:15:31 +0200
Subject: [PATCH v5] gpio: kunit: add test cases verifying swnode devlink
 support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-swnode-fw-devlink-v5-1-ec250ae6af91@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACLZXWoC/3XPy27CMBAF0F9BXtfR+JGHWfEfqIvEMy5WIYaYO
 qAo/16DKpWF2Yx0R7pnNAuLNHmKbLtZ2ETJRx/GHOqPDbOHfvwi7jFnJkE20IDhcR4DEnczR0p
 HP35zi7ZDq6m2g2a5d57I+dvT3H/mfPDxGqb780QSj+2fJktaEhz4YADqbtCiU2YXYqwuP/3Rh
 tOpyoM90CT/oRaaEiQz5JQZwGANQsg3kHqBBJQglSFjlFOiazVpeAPpV0iVIJ0h1E4ikWx7LL2
 2rusvcHhOq5QBAAA=
X-Change-ID: 20260609-swnode-fw-devlink-cdc8dc4e5cb4
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
        driver-core@lists.linux.dev, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14859;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DDexrfwDu5NHvITG0Ha+OqED6iW+uYW8OD8CSPT8D4A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqXdksMSCPbo2rNWmqtgAB5Xhjt62lHtlB3i65p
 zXh+8wbJJyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal3ZLAAKCRAFnS7L/zaE
 w+uxD/4xe5u57G/yQmYBUeZmPpdZBXHdfHxmR71TJtcEcAygZJJi9o1QtRbEk8sPPsOeR45JpSv
 KVXbLxwLR1F2z8g2niRldtlivhtJy5N6pUm65UDSf6mpe9IAPFk5675bY0CQg614JNJEF4nuCGd
 eqv4EPCF4O6yzGwoopH1FvpzRZ7ZAxjkcWz+ClpIB74rPfdQiG226BDWzaNB/i8mYo58Uh1HK2y
 LVvUqxVTRCauVa1Qo8XeOxBYa7vy2kXJnQsKyv/TtgdMmn5tw5pT8rwm9SvH3K4nCgNE3c2ylU9
 T1Q5d2UIpxRO0xE4x3pAkh93Rmz6ntV4oFMYv4bqGuz1FHA2/ivXSpmyXh+kjXvkw3fOA1HfnS2
 ZFIzjt8z/rxb6+fcTwaxEGWZjRzsLbYaq08swu5Kh1+ErQ56M0BmdMvc2z+RtY1umA5OR15spgE
 SKZ7Pztwwc8DpUODr3omEyIQ8GfZOU/UAxvBPbm/C9ciYrFwgEbCjj2fS3bAIyQELdIKl2qj+TK
 +PCy+AUzRRdIugIPqDCE2A2aN1TGLZuDvRjGulv8V0nZMQriaR6wk4hIIfXMYcYtTrnRsFWUELA
 Ra1KNvQjCG9ZOqM7wB6rjB5O0eWYYjV8GIT7Qs1frpec9o+na9Rw8zZqA876gOfpk9G5h2qOoEa
 Vi0AoRjz3XOzvXA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5dd935 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=nzuXsxulAAAA:8 a=v3zFvUu9NywDf_SoNb0A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Jn5cl5okm61iLnyvC_SE:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA4OSBTYWx0ZWRfX23NzCAFCUbsH
 x1Berht6tcJEjn+QPj9OfSvRxKh0C8X5Ntk9CVWrta8GjRfgc99Je6GrSCstwKlwAExtdz3EZIN
 MJ8QDk2kRg98jgYtjh78EL1vSXeIimE=
X-Proofpoint-GUID: VH9_nmDG6BaYkq7Y7ItJhLo_sdy7-DNT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA4OSBTYWx0ZWRfXzuR5nWVle7iD
 /KSUnUKUb0CLP8jm7H045VK2Eq1cBElcCzwlXNf81R4zaDWahjt2cSi2r9kfvJ8czPw6gj8dIhs
 y/gsST90UxfpdhSQUSnyUxzxPp3Zri4X3pgSzvpeF0c5BRKJL7XoVuOh2C+b21fh6S4L/do1LvP
 9URjEk2MvFNexPg71AAxZ9e9knqCBOExNR/sGk1RCjS7nlo/GS6M1aij+qA4NaB2wRVHIP1cEMk
 IUETbjXjlQEiAJZwPTjsXNIvDS7QYNNRIX28NfPSY8Y8xxXbQxSBzVBNtMP4fML+DNuqna6VwAt
 sbIqcabDf4I/UyfC/nscH7e4cBvedi6e9KsJZncVF/B/3jPrOXLOlsuT5DWawoOumVMoxERWCXR
 71nRbG8YZO5rl6jbU1Mt42q9oBmJOoVI0pFEfnY+wj4SJmk9nie55HHQG4HQk/yTeANFg1ZteG4
 TquTjJaEzXSRBkZZW4Q==
X-Proofpoint-ORIG-GUID: VH9_nmDG6BaYkq7Y7ItJhLo_sdy7-DNT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200089

The software node fw_devlink support already has its own kunit suite, but
that verifies the fwnode links in isolation. Add GPIO tests that prove
the ordering works in a real-life use-case: a GPIO consumer that
references its provider via a software node.

The first suite registers the provider's software node, adds the consumer
device first and checks that fw_devlink defers its probe until the
provider has been added and bound. The second covers the fallback:
with the provider's software node not yet registered no supplier link is
created, so the consumer probes, devm_gpiod_get() returns -EPROBE_DEFER
and the consumer only binds once the provider shows up.

While at it: the existing gpio_unbind_with_consumers() test keeps the
consumer bound while the provider goes away and then operates the orphaned
descriptor. With software nodes now being covered by fw_devlink that would
instead force-unbind the consumer along with the provider, so opt it out
by setting FWNODE_FLAG_LINKS_ADDED.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: David Gow <david@davidgow.net>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Currently only devicetree systems have their devices' probe ordered
against their suppliers automatically by fw_devlink. Software nodes have
lately been used extensively treewide to describe references to resource
suppliers: most notably, the GPIO subsystem uses it in many places. Now
that the conversion of "dangling" GPIO chip software nodes to using real
links is almost done, it makes sense to ensure no needless probe
deferrals by implementing the add_links() callback from the fwnode
interface.

This series extends software node support to use fw_devlink and adds test
coverage for the new behaviour.

This is the remaining GPIO patch (originally patch 5/5) that had some
conflicts with my gpio/for-next branch. It's rebased on top of the
changes Danilo queued in the driver core tree.
---
Changes in v5:
- Drop patches that went into linux-next and rebase the remaining GPIO
  patch on top of the already queued kunit test cases
- Link to v4: https://patch.msgid.link/20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com

Changes in v4:
- Extend patch 1 with an additional kunit helper:
  kunit_device_add_software_node() and use it in patch 3/5 to fix the
  release ordering
- Fix a memory leak in GPIO test cases pointed out by Danilo
- Fix more possible device_link_mq races: extend the coverage of
  device_link_wait_removal()
- Link to v3: https://patch.msgid.link/20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com

Changes in v3:
- Use device_match_fwnode() where applicable
- Fix a race between the actions on the device_link_mq and the GPIO
  test cases' swnode management
- Link to v2: https://patch.msgid.link/20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com

Changes in v2:
- Use loop-local variables where applicable
- Reformat a long comment
- Keep trailing commas on array initializations which may potentially be
  extended in the future
- Add missing headers
- Update MAINTAINERS in commit adding a new file
- Initialize arrays at declaration
- Fix signedness of ints where needed
- Remove unneeded DISABLE_STRUCTLEAK_PLUGIN switch for swnode tests
- Link to v1: https://patch.msgid.link/20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com
---
 drivers/gpio/gpiolib-kunit.c | 291 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 284 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index c9c5b437482012cf9dbf8d593fa686e248ea1c88..e6cb43a8df5b8ea3f1904ecfca4d0bc4fe2d0e83 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -3,6 +3,8 @@
  * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
  */
 
+#include <linux/cleanup.h>
+#include <linux/err.h>
 #include <linux/fwnode.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
@@ -11,12 +13,16 @@
 #include <linux/notifier.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/types.h>
 
+#include <kunit/fwnode.h>
 #include <kunit/platform_device.h>
 #include <kunit/test.h>
 
 #define GPIO_TEST_PROVIDER		"gpio-test-provider"
 #define GPIO_SWNODE_TEST_CONSUMER	"gpio-swnode-test-consumer"
+#define GPIO_PROBE_ORDER_TEST_CONSUMER	"gpio-probe-order-test-consumer"
+#define GPIO_PROBE_DEFER_TEST_CONSUMER	"gpio-probe-defer-test-consumer"
 #define GPIO_UNBIND_TEST_CONSUMER	"gpio-unbind-test-consumer"
 #define GPIO_CONSUMER_NAME		"gpio-swnode-consumer-test-device"
 
@@ -275,6 +281,265 @@ static struct kunit_suite gpio_swnode_lookup_test_suite = {
 	.init = gpio_swnode_register_drivers,
 };
 
+static void gpio_swnode_unregister_swnode(void *data)
+{
+	software_node_unregister(data);
+}
+
+struct gpio_probe_order_pdata {
+	unsigned int probe_count;
+	bool gpio_ok;
+};
+
+static const struct gpio_probe_order_pdata gpio_probe_order_pdata_template = {
+	.probe_count = 0,
+	.gpio_ok = false,
+};
+
+static int gpio_probe_order_consumer_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_probe_order_pdata *pdata = dev_get_platdata(dev);
+	struct gpio_desc *desc;
+
+	pdata->probe_count++;
+
+	desc = devm_gpiod_get(dev, "foo", GPIOD_OUT_HIGH);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	pdata->gpio_ok = true;
+
+	return 0;
+}
+
+static struct platform_driver gpio_probe_order_consumer_driver = {
+	.probe = gpio_probe_order_consumer_probe,
+	.driver = {
+		.name = GPIO_PROBE_ORDER_TEST_CONSUMER,
+	},
+};
+
+/*
+ * Verify that fw_devlink orders the probe of a GPIO consumer after its
+ * provider. The consumer references the provider through a software node and
+ * is registered first. fw_devlink must defer it before its driver's probe()
+ * is ever entered, so the consumer probes exactly once - only after the
+ * provider is added and bound.
+ */
+static void gpio_swnode_probe_order(struct kunit *test)
+{
+	struct property_entry properties[2] = { };
+	struct gpio_probe_order_pdata *pdata;
+	struct platform_device_info pdevinfo;
+	struct platform_device *prvd, *cons;
+	bool bound = false;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_platform_driver_register(test, &gpio_probe_order_consumer_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = software_node_register(&gpio_test_provider_swnode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_add_action_or_reset(test, gpio_swnode_unregister_swnode,
+					(void *)&gpio_test_provider_swnode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
+					    &gpio_test_provider_swnode,
+					    0, GPIO_ACTIVE_HIGH);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_PROBE_ORDER_TEST_CONSUMER,
+		.id = PLATFORM_DEVID_NONE,
+		.data = &gpio_probe_order_pdata_template,
+		.size_data = sizeof(gpio_probe_order_pdata_template),
+		.properties = properties,
+	};
+
+	cons = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
+
+	wait_for_device_probe();
+	scoped_guard(device, &cons->dev)
+		bound = device_is_bound(&cons->dev);
+
+	KUNIT_ASSERT_FALSE(test, bound);
+
+	pdata = dev_get_platdata(&cons->dev);
+	KUNIT_ASSERT_EQ(test, pdata->probe_count, 0);
+	KUNIT_ASSERT_FALSE(test, pdata->gpio_ok);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+		.swnode = &gpio_test_provider_swnode,
+	};
+
+	prvd = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, prvd);
+
+	wait_for_device_probe();
+
+	scoped_guard(device, &prvd->dev)
+		bound = device_is_bound(&prvd->dev);
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	scoped_guard(device, &cons->dev)
+		bound = device_is_bound(&cons->dev);
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	pdata = dev_get_platdata(&cons->dev);
+	KUNIT_ASSERT_EQ(test, pdata->probe_count, 1);
+	KUNIT_ASSERT_TRUE(test, pdata->gpio_ok);
+}
+
+struct gpio_probe_defer_pdata {
+	unsigned int probe_count;
+	int gpio_err;
+};
+
+static const struct gpio_probe_defer_pdata gpio_probe_defer_pdata_template = {
+	.probe_count = 0,
+	.gpio_err = 0,
+};
+
+static int gpio_probe_defer_consumer_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_probe_defer_pdata *pdata = dev_get_platdata(dev);
+	struct gpio_desc *desc;
+
+	pdata->probe_count++;
+
+	desc = devm_gpiod_get(dev, "foo", GPIOD_OUT_HIGH);
+	if (IS_ERR(desc)) {
+		pdata->gpio_err = PTR_ERR(desc);
+		return pdata->gpio_err;
+	}
+
+	pdata->gpio_err = 0;
+
+	return 0;
+}
+
+static struct platform_driver gpio_probe_defer_consumer_driver = {
+	.probe = gpio_probe_defer_consumer_probe,
+	.driver = {
+		.name = GPIO_PROBE_DEFER_TEST_CONSUMER,
+	},
+};
+
+/*
+ * Verify that a GPIO consumer referencing a provider whose software node is
+ * not registered yet, defers its probe instead of failing.
+ *
+ * The provider software node is deliberately left unregistered when the
+ * consumer is added. fw_devlink cannot resolve the reference, so it creates no
+ * supplier link and does not order the consumer - the consumer's probe() runs
+ * and reaches devm_gpiod_get(). The swnode GPIO lookup returns -ENOTCONN for a
+ * reference to an unregistered node, which gpiolib maps to -EPROBE_DEFER. Once
+ * the provider software node and device appear, the deferred consumer probes
+ * again and binds.
+ */
+static void gpio_swnode_probe_defer_on_unregistered(struct kunit *test)
+{
+	struct property_entry properties[2] = { };
+	struct gpio_probe_defer_pdata *pdata;
+	struct platform_device_info pdevinfo;
+	struct platform_device *prvd, *cons;
+	struct fwnode_handle *fwnode;
+	bool bound = false;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_platform_driver_register(test, &gpio_probe_defer_consumer_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
+					    &gpio_test_provider_swnode,
+					    0, GPIO_ACTIVE_HIGH);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_PROBE_DEFER_TEST_CONSUMER,
+		.id = PLATFORM_DEVID_NONE,
+		.data = &gpio_probe_defer_pdata_template,
+		.size_data = sizeof(gpio_probe_defer_pdata_template),
+		.properties = properties,
+	};
+
+	cons = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
+
+	wait_for_device_probe();
+	scoped_guard(device, &cons->dev)
+		bound = device_is_bound(&cons->dev);
+
+	KUNIT_ASSERT_FALSE(test, bound);
+
+	pdata = dev_get_platdata(&cons->dev);
+	KUNIT_ASSERT_GT(test, pdata->probe_count, 0);
+	KUNIT_ASSERT_EQ(test, pdata->gpio_err, -EPROBE_DEFER);
+
+	fwnode = kunit_software_node_register(test, &gpio_test_provider_swnode);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+		.swnode = &gpio_test_provider_swnode,
+	};
+
+	prvd = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, prvd);
+
+	wait_for_device_probe();
+
+	scoped_guard(device, &prvd->dev)
+		bound = device_is_bound(&prvd->dev);
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	scoped_guard(device, &cons->dev)
+		bound = device_is_bound(&cons->dev);
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	pdata = dev_get_platdata(&cons->dev);
+	KUNIT_ASSERT_EQ(test, pdata->gpio_err, 0);
+
+	/* Tear down the consumer before the provider to free the GPIO. */
+	kunit_platform_device_unregister(test, cons);
+}
+
+static int gpio_swnode_probe_order_test_init(struct kunit *test)
+{
+	/*
+	 * A prior test may have left a managed device link teardown queued on
+	 * the device_link_mq. Flush it so that software_node_register()
+	 * doesn't spuriously see the node as registered and fail with -EEXIST.
+	 */
+	device_link_wait_removal();
+
+	return 0;
+}
+
+static struct kunit_case gpio_swnode_probe_order_tests[] = {
+	KUNIT_CASE(gpio_swnode_probe_order),
+	KUNIT_CASE(gpio_swnode_probe_defer_on_unregistered),
+	{ }
+};
+
+static struct kunit_suite gpio_swnode_probe_order_test_suite = {
+	.name = "gpio-swnode-probe-order",
+	.test_cases = gpio_swnode_probe_order_tests,
+	.init = gpio_swnode_probe_order_test_init,
+};
+
 static BLOCKING_NOTIFIER_HEAD(gpio_unbind_notifier);
 
 struct gpio_unbind_consumer_drvdata {
@@ -372,15 +637,24 @@ static void gpio_unbind_with_consumers(struct kunit *test)
 					    0, GPIO_ACTIVE_HIGH);
 	properties[1] = (struct property_entry){ };
 
-	pdevinfo = (struct platform_device_info){
-		.name = GPIO_UNBIND_TEST_CONSUMER,
-		.id = PLATFORM_DEVID_NONE,
-		.properties = properties,
-	};
-
-	cons = kunit_platform_device_register_full(test, &pdevinfo);
+	/*
+	 * This test deliberately keeps the consumer bound while the provider
+	 * is unregistered. fw_devlink would force-unbind the consumer before
+	 * the provider so use the FWNODE_FLAG_LINKS_ADDED flag to opt out of
+	 * it as a workaround.
+	 */
+	cons = kunit_platform_device_alloc(test, GPIO_UNBIND_TEST_CONSUMER,
+					   PLATFORM_DEVID_NONE);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
 
+	ret = device_create_managed_software_node(&cons->dev, properties, NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode_set_flag(dev_fwnode(&cons->dev), FWNODE_FLAG_LINKS_ADDED);
+
+	ret = kunit_platform_device_add(test, cons);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	wait_for_device_probe();
 	scoped_guard(device, &cons->dev)
 		bound = device_is_bound(&cons->dev);
@@ -408,6 +682,8 @@ static struct kunit_case gpio_unbind_with_consumers_tests[] = {
 static struct kunit_suite gpio_unbind_with_consumers_test_suite = {
 	.name = "gpio-unbind-with-consumers",
 	.test_cases = gpio_unbind_with_consumers_tests,
+	/* We need this here too to clean any left over links. */
+	.init = gpio_swnode_probe_order_test_init,
 };
 
 /*
@@ -593,6 +869,7 @@ static struct kunit_suite gpio_swnode_hog_test_suite = {
 
 kunit_test_suites(
 	&gpio_swnode_lookup_test_suite,
+	&gpio_swnode_probe_order_test_suite,
 	&gpio_unbind_with_consumers_test_suite,
 	&gpio_swnode_hog_test_suite,
 );

---
base-commit: bc289224b9a1b0a7045c81272172342811b5c0fd
change-id: 20260609-swnode-fw-devlink-cdc8dc4e5cb4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

