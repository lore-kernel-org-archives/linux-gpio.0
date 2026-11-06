Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965492;
	b=Ke8jge3PmmCHCZVYaJPJNN21UCWL/vpe03Q4BOyTu0sKWbcDGcQ9wDMd+6ioAqWLDrTb
	 sNqoU3GGvnSxLInHVhL5xJ8xnXWSH0iXthjScJm/e8NSSPwpLfTVVuHicduzFxgLV/M5C
	 ucjIdkVcYpJTbWfQDDMTpxkLdPjdOsyXVXJ2XAHV4Ce+99Eemu7DWlt7xD+3cnF48QKwG
	 ADjFtdjLQeLYfAlhPBsZ14LSXXio99Zhb1bTXDceZ243aZVPFRURWtpeMCiC8Cepc+HSd
	 c/QhmC6IQnMoJsTnROippPr6BqWe6OxzwLXxksrt7jV8w9Cvfngkb08jtaY5/CeVcPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965492;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pC/nJ0GCDG+0Nj20cR5pfIVsjOwhhGEg47XVbbpDG+E=;
	b=dCTfD0hfF9C+5zH7k2mM0Z6EkVl3mNU9BP6ZlHkkyleaMGnGVJPi/uKUc4sIptBMPyz6
	 pGFAXtXRAH0fYaTXKR7Rk+LU3OfF0dlDvK75Ngz6iOsh1rrXTCb2ahi//Gq/az10ZiDA7
	 Koa+i1l8QPKF7YAr2io0lZGOxna+BlCFrp5VDnVPPGK4Ht9CmqBxCkF8+lktmIkkAj9QX
	 PHAYr1xai9XjhhzIbUsbz+nPD4JkKcUZU0Xs/0hP7I1TShmhrZo2TQld/b2OyISuZKI2l
	 oQRgRanChgLhkpt5y9Q+RRfds9woqeC4Ue/lCJZ417Z1xQYc0zP+Ue+BbIZ5t4Xrfww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UeyHO33x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SNKeNyyh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2D1606A333
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 11:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC2D1606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UeyHO33x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SNKeNyyh
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APCF9444212
	for <linux-gpio@vger.kernel.org>; Fri, 6 Nov 2026 11:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pC/nJ0GCDG+0Nj20cR5pfI
	VsjOwhhGEg47XVbbpDG+E=; b=UeyHO33xmbkTHIw33xnqGw6w8n1vVOSL4ldW2A
	GCzwLQzXlMjrj0fhQpqTzJ0zoQX8eLIEZ+IuSbB5hWS2SuIy1h5wF5z9KeFgV+A6
	DcPIbT6iIE8OtDlgES/DMtugKHO3AQyx5hCmC1OqHE52VEjz/CsgqrecNmgRYYhl
	DwjUkX5HbAJGdfiilp5hZY7cXEDiyWlyjG6uNu6tLkkwlrv/V1tZalVXe2dn6VT3
	7CWCPJx6SznGkEZm/XMk6EcNdK6jn45nfaEN4IRDrzjgnq5TsTK4GJJ7pQ0yT1kF
	IW4FbrFncx1KckbFAyUEzizQdGTJTwmFKOsh1SlrTfMU+VOg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9tnc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 11:44:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so128667385a.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 03:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793965490; x=1794570290; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pC/nJ0GCDG+0Nj20cR5pfIVsjOwhhGEg47XVbbpDG+E=;
        b=SNKeNyyhf4cOfK8AswS8foPp/QZjxKvtwOV6aXfJFwes1k8yRHrw5Uk6Zp1rPbua+F
         GDl5KcOks4I8q0oqVkkbZnLXCD2Bw/xGn3aWbcudYNQ/t6gGHsieyNfryROCMambAJGa
         wEelu8W34G/POKxZ/KWoODwyrnVedkEhqRvjPL85tDJVfs9Oge3Omx1qfBtW7UDZ3ajw
         g9TD0gQJdxGJcw2mX/Iw9MJR7VU9Wdbv09jJ5b7RpA6d4+6WUJg5gFri+hnX4Y+7JteU
         AKLWCeMgMYBenJAY8nWI/0Y+XGsCBSNFm6CkXJnvzQBhyKEQFsJT4YfBBBU88aETNKWm
         W7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793965490; x=1794570290;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pC/nJ0GCDG+0Nj20cR5pfIVsjOwhhGEg47XVbbpDG+E=;
        b=JDe/qvl6T8d6enMGj0unAnSaqAy6LHLbH/H1ed8utJdkitvVL1eAMucm5UtiSXbx4H
         r2e2SVN2FN3Jt3lxw+9T0IWkZDC5JVpHLHGgWCL5mAniGlZFZGQSZ3f8mUMCcbISittW
         FMY6CCYE5aZVG+pL9WSg9lGMjk1FYynXN6Zy3CUX9d7oviNw0ynphUMgicC2ArdPgMmO
         ogSxecgfzJbIUpVwr73K5bzwv7JjubvOxH/llWM/j0stbA4psGtVGYBLgEytrGoKvdZe
         QOo5rh02FqxFJYupLzOISUgX1tnTl2Yhpywc0lhKn6F1zn8iqlBEmAr8SuMw8RGkmfGU
         juJQ==
X-Gm-Message-State: APuU4Z/4qF05k4aD38K+gXBtuusP1S1V8EJUCA08W6nfkJmQRmmTPGgH
	uiQreymvqEKEcC2ihD3vFn+DlZJ1PBLN+jcJ8/jJWqodvYgH+9OFK6aU7Hzn7WO1f8rfp2dK8Po
	fLX7t5lZ8R1/tE7EGK4X+CgEDXcwe+LYwltlX4akgV0rgfmErwBBAG6+cH5pT67ux
X-Gm-Gg: AYBFou224dC6dCyQNvlBiWCGkmJE+6V28LJ+etDZ7xFSg4viR2cUUgoYL271kR0j1qm
	hO+tQ9vtcbJyafggwXcMlzhuirnYlyca6iN/Xy9oXdI1ePqHlQQ0CeEo0kYrhHy/g4JQu4c+cyP
	tL7TKF2av+7z8+SC5uAbIZ0G59o0v7Jlv10wh15g9ijb44YDMvVCUgKUaydw8UmOCboWLZt9gUE
	xyMvWt3tAywihuUQiTaTnWG9vLJ3pFirinGLoasUGrDVm8jQn87aR03nCG1te9Wcw82edxhNfCo
	K4VREMJqkaxXxS3emTauLYQC1NFhP0UKZJCgCgx11uZhDiik8T4xD7NY3TSmoUTvfeVlz6Be4u3
	JWs8jpizBZVZZPlEw1+4/t5rTcfQRBcvp3rMViHlFZuP1O+hni9kwtWgsrPv3RElASD4o292rVk
	edNA==
X-Received: by 2002:a05:620a:2b94:b0:939:a199:45b4 with SMTP id af79cd13be357-945f354de70mr311148085a.39.1793965490067;
        Fri, 06 Nov 2026 03:44:50 -0800 (PST)
X-Received: by 2002:a05:620a:2b94:b0:939:a199:45b4 with SMTP id af79cd13be357-945f354de70mr311144085a.39.1793965489587;
        Fri, 06 Nov 2026 03:44:49 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6af5f0c63sm63046115e9.6.2026.11.06.03.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:44:48 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 12:44:46 +0100
Subject: [PATCH] gpio: shared: fix a race in shared desc release path
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-gpio-shared-refcnt-race-v1-1-79c9167505ab@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK297WoC/x2MsQqAMAwFf0UyG7AdHPwVcWibp2apkooIxX+3O
 B7HXaUCUxSaukqGW4seuYHrO0p7yBtYpTH5wY/ODSNvpx5c9mAQNqwpX2whgX10EEEKEoVafTa
 pz3+el/f9AC61CcxpAAAA
X-Change-ID: 20261106-gpio-shared-refcnt-race-2b1eddecadbd
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2977;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lV+NzDhqOpuSj4t5jSX3b42vwy5BE/gIo5RNob+kMGU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7b2w5sKuEuzpUfKRoVmwxSnwcYwcG4Cg24Hqu
 7JwFM+0bxGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCau29sAAKCRAFnS7L/zaE
 w9YDD/9t7h25sFCyT1qSMRGCZS8k+CXwm+hXNlFf84QCZa+RApTrqgGDq2EQmSOwyOQ9Kiao2sx
 eabh5EuCEh77skpOAai5Jd/iR9UiR37DdbevadUnCMNHYzzt01nDsJdV/k2gdwyCG05Arr0q0FP
 Au8C66ZA0pAFp9c2pK8WpTN51Zd82Om4ypEtt8g6S+4wJnNGjdB9+cklHSznGITRAk+lsiIe6mH
 3NuBjLBnwyawMQ2XCWbgmqk7p1ai+4wp8VDWYd7BySRgpwzjP3CEYn5GKEX13Qn2siVi9HLrkRO
 1nBQ58XegXhNCHNo7+T57L3fbZLrsVuLeKyEOeUJXq8gLBVdcK5Ghd33vaSvjT+joqyjgAi4lOf
 cdENAnoCecaiG5gFJFwmet5+aD8WPUM+9fdcL/ZM8128vRRtzW8YS0FRsnIOgiMDRBwBmOz7tey
 bXzZdLyL00SvdJQfbEPfinSo4+epuJ1a46RNTqRkK880A1GsWrnD5EDJ8FZWeDXFSLQaDExMAH5
 aGINJ02jnOPFU5MqGSen79AYiBCuzjXNO+irnxSNX20b0nHWus6K0aNyursMCDGl9GE6Qg7PlEV
 jGlRpwNuELCcIduZGHcIh4pUYPfezcqm/F/ctZh2B3SbHQIyKEbjWS3tV0MgVlmwmBocdEI+/2X
 mtSTmucOEZMJ2ug==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0NiBTYWx0ZWRfX/Rd193E4/Kcs
 ZHsfh1EXaLj8Uz/8pdsFbBP6R6Sx5h0Wxn/QpT3Klb1Pq99iAIOOfDwMwgDEwH1VcYYHMuDYPiR
 ZSP75vGkoPUQiTmb7mbJclcSZFlNluY=
X-Proofpoint-GUID: ONfqxZEVHd2JggQ3euwNxb-greUI13wN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0NiBTYWx0ZWRfX+rtIVL3Om/hE
 4Hq7hsUz84MmGL04Lp2rACVqXiI6uwLmSOk5rP9Wo8aLlbvtGijIDtvmNkC92SLOY3gnasmkWwT
 bh4DljhKtOOCP7Dm23kPE2hPwAKwsmi0ZS6rfus1u37+RE37zdoMmqbYJy76Vivr5tvPqoAJEEJ
 G+TH+U4akZnNIyHNW97vKiPv9YZKr7/QTpJECETqQrGoB47WD52hBGNkpJikUsSm5ogck+DK/WN
 F7rblr9Nx64TrVjRrjFLIqbgZQchif4axqMU20+zspCSPl5uKxnpgoI50jpBNvb2apDMlmLKxlP
 toVPz4rpF/U/pMmEjea4fpg/Td5SZ2/EagT3/09E7EWRmQKetY7wgB9EhvqHQ6kXlD3eGUc9U9H
 aoyJ2pURQoEIUGrTRqVromw1WninIAJAoFFZuvKddI8mriBU/PWFf4KL/2qxn7AEO3UhCxlaDZT
 i3HyVzIZFSUfGOT0q4Q==
X-Proofpoint-ORIG-GUID: ONfqxZEVHd2JggQ3euwNxb-greUI13wN
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aedbdb3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0vXQ_OGjYFdhHpkQICYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060046

gpiod_shared_put() races with concurrent calls to
devm_gpiod_shared_get() like so:

CPU 0 (unbind / probe failure)      CPU 1 (concurrent proxy probe)
==============================      ==============================
gpiod_shared_put()
  kref_put(&entry->ref, ...)
    refcount_dec_and_test() // -> 0
                                    devm_gpiod_shared_get()
                                      mutex_lock(&entry->lock);
                                      if (entry->shared_desc) {
                                        kref_get(&entry->ref); // on 0!
                                        shared_desc = entry->shared_desc;
                                      }
                                      mutex_unlock(&entry->lock);
    gpio_shared_release()
      mutex_lock(&entry->lock);
      kfree(shared_desc);
      entry->shared_desc = NULL;
      mutex_unlock(&entry->lock);
                                      // uses freed shared_desc

Because gpiod_shared_put() decrements entry->ref without holding
entry->lock and gpio_shared_release() only acquires entry->lock after the
reference count has already reached zero, a concurrent call to
devm_gpiod_shared_get() can acquire entry->lock in the intermediate window
and observe a non-NULL entry->shared_desc. This can result in a
use-after-free and a double-free when the second consumer releases its
reference.

Use kref_put_mutex() to ensure the entry lock is taken without a window
in which a concurrent user can see a non-NULL entry->shared_desc while
it's being released.

Cc: stable@vger.kernel.org
Closes: https://sashiko.dev/#/bug/linux-30e071e4-4e4a-4b63-bd83-df1147055d35
Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d9330490b17fb3936b8758beb97a308a15..f6cf298e28b082d7719004b92314eaed1184f2be 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -635,8 +635,6 @@ static void gpio_shared_release(struct kref *kref)
 		container_of(kref, struct gpio_shared_entry, ref);
 	struct gpio_shared_desc *shared_desc;
 
-	guard(mutex)(&entry->lock);
-
 	shared_desc = entry->shared_desc;
 	gpio_device_put(shared_desc->desc->gdev);
 	mutex_destroy(&shared_desc->mutex);
@@ -648,7 +646,7 @@ static void gpiod_shared_put(void *data)
 {
 	struct gpio_shared_entry *entry = data;
 
-	kref_put(&entry->ref, gpio_shared_release);
+	kref_put_mutex(&entry->ref, gpio_shared_release, &entry->lock);
 }
 
 static struct gpio_shared_desc *

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-gpio-shared-refcnt-race-2b1eddecadbd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

