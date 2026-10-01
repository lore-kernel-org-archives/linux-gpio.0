Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF5E5208C8
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865137; cv=none; b=F/YZ0YoypywFPWLyzaxegVapFz5AThd3943v1VkzrA41v0tAOq1ClvR/PgofcVrEcCFmfgg89u3m+kfxcSLlBCtVypXHBkrUqzqNhUANQkQJhTKL8PDAV68OCnPfaD3fP9MRIdS6jf/550D+w62egJ4Qq9OH9JtcuyX5n0Jb6Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865137; c=relaxed/simple;
	bh=YWcagTm29p5qJnhkx2n+r5zM1nNxqP9qfROusu1U1MU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yhs0r7ilOaLlOR2CM0MrxmveYHxerpXe/4Q5bUP0G9zGgXgV2XU3OeYnCUNaBpfMOdl3cb1VjojNAAyIrU3nXwC8pxGQQ51vYVcR8ClKvTT9qc3ChhG76klO06GLFQrNyeaQQEWlnD7B3WKH+Y5MAl9USdENDo94ZHVkCatWLbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGqrN62r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRhslXMi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGqrN62r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JRhslXMi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjIaD2825617
	for <linux-gpio@vger.kernel.org>; Thu, 1 Oct 2026 14:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X65urE6pCi4HjhKWTTcbc8dQLF4W93p9tRsN8DTwgwI=; b=OGqrN62r8dbb3fEp
	2hZ6FTSNhZU39JMJS13y6y8T6sQWGOWcjPfLhjI1WtFwoHhY6+dATFEmgdJ6LNgR
	yzgk9XJzhyL5dyMs5k3s1anYHC8FICec4AlKaURDkYancMNIOQAd7K3FMSDbZ44r
	fHkmxthDG4st11w7hzKLRlrX+VdCrkN4yiX38KebSsPHldWVM4uG+AhG0+QFPTyK
	2ZhfYZHZblXe8JG8NkpOeBFR/aze89lfRUCBSSHOPY57doCtdLJm4esqE2cb46/F
	0i3/aNbTuEjNT9vxbNLJlUipXiMWwKupLcqrRo+UdnF0ZOIJ9c2PXqNbuZbDHQ3x
	q2sQuw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcft0mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 14:32:07 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bdb408a368so363337137.2
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 07:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790865125; x=1791469925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X65urE6pCi4HjhKWTTcbc8dQLF4W93p9tRsN8DTwgwI=;
        b=JRhslXMia+Mlttm2hKfB8G65K36PgX2sr7q4LeLf4QBuexocghOnuJPyHohj2VFtaP
         wKIPzA4Eyhlyl2QtEbJ8VcbdTeRkcHSqmWItIwkrUIbG51Sz34rBMpPFHItnfTDGIgR8
         qqD221WvBFzDe8joc+sww9oKfAAir+YUnocBgYyni1JIxsl8NTUUuyGgp5qTxsKYNxhk
         nUmbQqyJDdn17mu0gJdBHeFssxnY2LUumdGU/GOw3sEAVfnAo5uilIGMh032WdW/id2o
         BuFIbRU2p5UgntQleeEniV+8Ybdv3/D9KRmpW+gxk4+3JYQ9xOJhWrGQFyXTfF5STMm+
         htnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865125; x=1791469925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X65urE6pCi4HjhKWTTcbc8dQLF4W93p9tRsN8DTwgwI=;
        b=fm3gufKw6SXIvPsNCdZDn2x+ZqmiwB3IqPAEV0ZZvMyGWF5bB5xWzKZ3NBvNPh3Ysd
         OGj87wMSRWtEmelX29TmgqMmIuO33VV68CgIQ/89W3pbwD0kmUn6UfK9tNKeOAqGR+UC
         ST7kyyvzX4CtqnPFAOgthcr2tyEB1SvhQZH46lHCc7Q5TXxhUidwX9ivSf/DVOBCDnH6
         1yBKo6ZLWSUt5fGhbcjR0ocCJbfpKFd305/66GoVRG2wlYGiXrjz9/TXpiGlzBt4Gq8H
         SFdzJZlLP4lBuDIhYpfzrKvFPiv12+0LYFxZwBLliO28+CJpo4uI7F57IAD9JUtO3f4s
         thEA==
X-Forwarded-Encrypted: i=1; AKwUvByJq91rSLOXKISytO5nU8RdU/rUZayHNyl5F9XXS0OQ/Tnr7kLcCA8kVzdN8sCjVDIlmitI4qlyV/7p@vger.kernel.org
X-Gm-Message-State: AFq9FYKm1v11HNOReu6hIJ3tr6LGXMaeAyLdnDIrA2KMzRAbEO7JprNe
	PAVoObxscbW3YyRvs3MxuY/x6n2aGP3I/uLOegmKyd6pNX5AqLFnhb0OLQFwXw5Yt4ojYBuhCqU
	dTCO9MhlAYpLm3gouerjxOqHB/9HrIrC0/Dn0OPxkl0XPh9+iii97X86X3fYbR3XwRa1XbKoC
X-Gm-Gg: AYBFou10m3SwSMT/luEdepRY4RWACajQHKSOjm6/EQ/9InYtZNT1LBSy8ykGTdLPZX5
	DV/Nbxsbads2iDZEoDJNlU82BCDpgjfRyktLUHguERtIlCq1JBUvneN0rK89jniTuwsKgj/ppR9
	SUXe/84RmUgwXo0ScTu8EBMhBRY7OBJk7WoTX0srCEXe3PTeOuATUoQBZo8RpacHHJpSevnEZY2
	jdQeGHO+t8KGP0W2mILGy+G71UyQ0tosyKA7BckQwGKdAsIz/HqV9T61vnutfIPI7PbuuhKgxCN
	CJ3sakCccNMdz0tatSUw/VnIZjN8t2A2ER+fq886cyJPowE6FgEF5HoI2UV/0J89jH7+y9ZXix4
	KGEdDKrZl/EfCaPIeJsC8gbVGGOOT
X-Received: by 2002:a05:6102:6a91:b0:7a2:2a4c:606a with SMTP id ada2fe7eead31-7be729b71c7mr1290576137.15.1790865125340;
        Thu, 01 Oct 2026 07:32:05 -0700 (PDT)
X-Received: by 2002:a05:6102:6a91:b0:7a2:2a4c:606a with SMTP id ada2fe7eead31-7be729b71c7mr1290564137.15.1790865124851;
        Thu, 01 Oct 2026 07:32:04 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027276b6fsm321855e9.6.2026.10.01.07.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:32:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 16:31:48 +0200
Subject: [PATCH v2 2/4] gpio: shared: gracefully handle no-device lookup of
 shared GPIOs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-gpio-shared-fwnode-lookup-v2-2-9a40681713cc@oss.qualcomm.com>
References: <20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com>
In-Reply-To: <20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1573;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YWcagTm29p5qJnhkx2n+r5zM1nNxqP9qfROusu1U1MU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqvm7bckSZ1ybY+o//FlZDq/jTtSz+dIe0sFgLf
 ckeiMEZXbiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCar5u2wAKCRAFnS7L/zaE
 w6jrEACMGUiniK0U8wh/NiIcHtB5aUyJYoxD1cYjoMCf4ahoj+bUA6SljzCnmgdhAT1wSWsvNNk
 3p7KxOxGj+xYFJUGoPgK7kdAgxzxw90Ie/tHYJWk5lAq3/PAXYKuE+QmnfuhhfQ42Svuus8BSII
 I4jEd5DJjRFsl7nMKQaCGecRKoYEMPaMkiQticpPD9vaC1WuGfC3VglrdPMzy74HBVxinJuo1oX
 2VNf5Rzjor77EkC/7aiwSPDmGYo2hpLK2SNV7Xb4n+5+Q+zerAc+tzYIxe2mrTyIlx8lh96Al2K
 Ib+TY9h0HlSzGi6kljlq5NUXwlX72Y2RTf0sMA8OBhXoFdE2SecJoN2wYEkjwaCzcub9kcbK7Al
 xLKekx14hU2VLBk4PD05BvDtAazNPnz9hWHIT/WqSVV1DMbJLSfE3GQ0ZAL47pebTCLuSrpfD1n
 Mavz0rwmitllhjeUiTlvUjjTUrfxYHjhU9bShFux3PaZ9emTJnsGmo3a4t2kTwMzcKGbfOMzvOA
 Hk0E9mrTSI4j1iyCPEE7+UUcarGqaWKTnvjEomlDrLPSylF6AlE0iDtHg7HMxu08FvDNMUB6v7/
 jN0SXpftUjRID6wqFYShz/Bv9mM3BYLaOluZHOyDKxQo3jSTOl2aF5ZB6n9j/Po2brsYk7Ig8Se
 HSY3QKg88aZz8YA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfX0NtfCunbX4jU
 R9V2Vt36HeyxTxP/G3F9MhY/zdETiSW0TXo2qNdPUGabr1GLUuCsAzBMtDTSCbE3quvDDywUVMY
 PZ/AClTYdvh11EGskqAQgjGXbeXLIjI=
X-Proofpoint-GUID: 6o0ySaxq4r89SRPkjwM0wID9SE_9ywTi
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abe6ee7 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Il3CDtT01e2KgOc3ggcA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 6o0ySaxq4r89SRPkjwM0wID9SE_9ywTi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfX4i3mS/3ClCnC
 35L+EG9mKQVEVFY5BW5LebCic6ciYBq0gMWvU8Alrjt2GtvgLm6JMEzpFQSfScuSNmaN6dgVMcp
 90ERI/sfeAHmdWxyjVbzZVgK9UHunp3xBgcLI2khJmFSwWLmp2tvpR2tJxDmVuhePHBTptNgEW0
 2JnT3OwRv1iO/wb3dOcG6rqMW32Op5O7cfZwDGr2qNqScbLdXUAUw5WTDdTc3mO85R8/x/iLoc6
 oTEMm8vHGqauRjuIIy5oYaCzJExkq2Ugu3boRGAdm82wlkaq0UYz+wpUaOGll5OMO162S1ywglc
 MARif9XDtnmo0M3hzHNrfdjkrdQPbJw570Zp94qRIlcntbWVX2kDXiDchhTUFF5WJkOYmCmE9eA
 tGxoxWosWsuqc6kYziDoYP/X2ta2fpAN2FZTe1AUaIm5wyxRYSkxRqCi+9LsPRD1sBlbJQhI53w
 Z3V1CMb595x/khag4DQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010057

We use platform lookup tables for shared GPIOs. This mechanism needs a
struct device to work so fwnode-based lookup with no device associated
currently causes a NULL-pointer deference.

Adding this functionality will require a larger rework and it has never
worked anyway so add a check that allows the kernel to gracefully handle
this situation with an error ahead of implementing that functionality as
a new feature.

Cc: stable@vger.kernel.org
Reported-by: Abel Vesa <abelvesa@kernel.org>
Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 6acfec73b73477245c7e4c593f2925efbc8980c6..8c9ac9d9330490b17fb3936b8758beb97a308a15 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -449,9 +449,14 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *fwnode,
 				 const char *con_id, unsigned long lflags)
 {
-	const char *dev_id = dev_name(consumer);
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
+	const char *dev_id;
+
+	if (!consumer)
+		return -EOPNOTSUPP;
+
+	dev_id = dev_name(consumer);
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {

-- 
2.47.3

