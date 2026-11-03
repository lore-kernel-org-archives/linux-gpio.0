Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708489;
	b=oaIl+LhymWinOklR2uGhpHNsEyg7gXh72+3VYDI1V4xuQFj9Yy/1lEivVA7eZpY2tx8S
	 TH2wAB9gY1a1T6oSNBsaQz88ZXHUOYrYnsNLZbW8mbA7X23mkPiV3/pW9CHoGumcxSoGl
	 bkWs6Vt8Fc7ODYeMRxr9G9N8eBoryer1p/2ImbmJPa4X8LQhEWKyWiqvV7Rc+riudoPNR
	 MedW5A6Mm3JI97bgmPL4243IF8NMvI8H/TIMc3UhrgppdSo86j8kKPh7MVGRjRGdknZwU
	 F9C5fDeNPxLfFpEkhRGzrhERcwUH8QnH2lSjXItXsEokYXUo4tsglBKkMwzAJtuuEKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708489;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=;
	b=D1HFnloCnxMQwhOjFBOXbor18A/d+qbYeO8MFg+1RwabLB7TubeprnLdBzsnfOodJLwn
	 H/q9mn46LWJkiNhNCslbp/JcGPCVp19Cr+g+P+SDSeuB4mrzOeUNlagMhlksaE64IfVPT
	 xyGgpItIqcIgL+VaJPyApwfQushwjUm/CEyB5PDHRPcJx292PnqdsjAthyHJVeW+wTFpO
	 oksUVs1sOV9IfMNSf5JMLaUyRONd03JsCZW+e8PbU+LL773Cw1ZzNTLyl80rZkaeNNpce
	 kZCv0f7DYVChn9aqvUeo3pnrN1bYa2k/sR5ab4/V/py2WwFB/qk4buRfiwy3Fu3mA3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="L/zkIaJR";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jNZbp1K7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFECC606A336
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 12:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFECC606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L/zkIaJR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jNZbp1K7
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ABYP12002763
	for <linux-gpio@vger.kernel.org>; Tue, 3 Nov 2026 12:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=; b=L/zkIaJRxxUeF6aZ
	Iduk03fXN4VfiteUeYQEDWGAryxfn0/y2C2bHxWx5FavCSHi9wyzbfqf7yXv8Tyh
	+BsR1xTG5cbwu6ypi9ZvbQMziCVPCr6F0aX5wfHfwusB5Z7UDmGl58MyPRElhd7z
	w6DiP7UH8X2mCwXZZD/E+N/t5qB4srEG6Pk+1l9eXWsrOTi+zk6p8KS24sic0oNn
	yepZ7jNSZhU6uIRAmG8gx3JcyTkevao5SXICkcT3SurNm41NEVhC5nrs0bXoDf9B
	vB+WEwpqlMIZkN+cspWd6hpqNn5NW/L7lnaMm3BCDzUWbb2nScSjc+Mmd8fgG+ME
	ba95RA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7ycsxpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 12:21:27 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eaad995a7eso955732e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 04:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793708487; x=1794313287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=;
        b=jNZbp1K7b/2lx+a8HJ5KXvwpY/4ESSoZzHC3Q6HlKg9dWHKDVB/c5dr8wcpoJDUrw9
         s4ENtKwkxQDL5naGXTVPa6IYiRJLHaqv8uAV6dUZqJt7XAGTqFVWl8MuM1YHuIThAOZM
         rEqebSbqLkdls5FPfjFqIiiA21F/xpryTMWCBB2F1NndJtJzN+d3epKjlY4kt1F2Uc6L
         RDxhUZq0Xvj3yshoJ60B+jTuDEElbxQtNaD5/+l4e180DtJJAozWNdf6q5buD/CAO91g
         YGaO2hdPwyMbdMQFvUVX7ZxNbe6ZuoMMLUGT+ThfdGZ6YKGyWZNkJ/P4gYktePO1FtS5
         gq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708487; x=1794313287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=;
        b=vJSzsyNxea6zVmSKB9PUYnVB+mhETknFhkwDyOaGAz8IWh8tD0KkDKNJJfznRUEMC5
         pEX8+uEzW5QszMj266YOrIOgwCu0/5E5np+ZyEnBV1e5lYRBz6+ZLQH9sfvdu98wuHhm
         du5Rlt0t9c0VwDeLElAE+JW3MPJmJgDNKmeuF/Oay9AkvBgfg5EAWVndOGaVRPfzjuQu
         yuaM3TBNBnvkbSfZHmOwDqyO0LqIZxDlQ9/1oqkJYcPqqjAApuw0R9q7Tphewvfy86sX
         TxnDvUOv5sQQQeGmM9ig4qLDYbXsZyiK7/uDydTiYjgOdxHRhcY9fF+B527FnlCm6aDA
         k3IA==
X-Forwarded-Encrypted: i=1; AKwUvBxpTxbhwtGWJWBCzjOHUMXBzC9ic82XfkHLOEtaxpWpdK/hJLsJ1Nu8x4hpU27xfTtLfgYoqokmlw6i@vger.kernel.org
X-Gm-Message-State: APuU4Z+5nYCmZL+HhrVJt3YWXqnCGeX1b4q4B2jW56Xh4O+1E9Ovgj+H
	Fzy1XJgC/f30vsp+bm1d3PiUUR0MqEMp7qtsnDVQjJZIsjcWp6ddSKZI1sAxu3QcTq6+qTYLPS+
	xJz48fNUUUkByvYDR1/3B+8bqFH4ozff5VotC08Dt7Yox9UWkB7bCfBqw2I+ZgJn9Npm0BJ2t
X-Gm-Gg: AYBFou34hwR5+N4lD7E7fb7b7YShvTr8MY0Af1eUONWvr+gNHbnvd5fWGgHv6rW/v4R
	zTYUKOPAePcXKA78c094FanmBgyQYtTfX4AtMyphx5BmjhWc558luI+p9ryrgacpk67wet3/zVX
	PyOrkepF5APF9/5Cpra7o1n9IRWvC17xwhdZVbGR3Z0z6rTm6cLEy3v2yE8iingFpyzzMYO1PV4
	fGzBz4vnf4yNayKp1RwR5tC16N/gPnigF5FNqTVppOc9cFplIdlkVG/mufw7NKL2cUGiPdS49QF
	0At4dB4xiiw5GxB4pGvDnkCb+YZB7mPqicLP3wcmZvmQXzQCgX1xOLlFNMbuShSUWkwufzhmX2x
	r34argpM1+xG032ZhwdVUGgZ35MYvhy93E0qOV8lejqi3+75ImgUovu2qIK6Apnz++6atCfhItQ
	UXNA==
X-Received: by 2002:a05:6102:3706:b0:7c3:9b0c:a75 with SMTP id ada2fe7eead31-7d0725ceb28mr4084412137.12.1793708486486;
        Tue, 03 Nov 2026 04:21:26 -0800 (PST)
X-Received: by 2002:a05:6102:3706:b0:7c3:9b0c:a75 with SMTP id ada2fe7eead31-7d0725ceb28mr4084404137.12.1793708485974;
        Tue, 03 Nov 2026 04:21:25 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm24378293f8f.47.2026.11.03.04.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:21:25 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 13:21:16 +0100
Subject: [PATCH v10 3/5] gpio: shared: unwind partial failures in
 gpiochip_setup_shared()
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
Message-Id: <20261103-gpio-shared-fwnode-lookup-v10-3-c0c592c8ab0a@oss.qualcomm.com>
References: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
In-Reply-To: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2799;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QekYjtrADoWd66GPIisjizU3FTTnaBTEJebZvmRuj4A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6dG+/cg6goh5Nqda0LhUqPC1f+YZp+Qr4mN6y
 v18/ZW14TGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaunRvgAKCRAFnS7L/zaE
 w3kQD/9gf30U+O/gYGWmckn3O27+6KmRXS42MTsduBSRTKcL2dSvTIyfq6AXHmKOIYufmQWthVt
 QLZ19+0X9XVpgpdFdOUNgCUDMw7SMgqsD8UjxqX3npnjmYu8sg3ZcgFduYlITWwgCi8qWE57RFo
 VzPTWA8cV4hqYHxfHBXI+Gh0TN+jpvczcTLAmixJWOGPde55oeiIgeBhY+HRgUtMImqsuYl0FA9
 tCpItlT0iFjSGXd1QxXfJ1/EjNIwbXKx1G9I1PabzYwuiBxub7JTdcxp/AOgrN2K+wthd7v6e/y
 v7mDQkYdoofPZlvT40lSmjz963QwkpRgEzcPvT5jmYU5MXMcoY2qOn4wtbfypjm6UiuVzTqlC9I
 N5OiYzk9eB4h6+O/mU7TcVloAct+kfEB3INyroFHNf9bGWjpW8GjUYHOg/K8Gx/7dOU3y7UDvbj
 L73ZXYXCYmcQwyUTPSLQ4fEh7i1yuEciW2Xze/KY/sB/Tko7SA1VJqDGaOrGP+2QHKSR9L8M5KU
 Ql617TUGDeCX/eFCHa0XQrWtZuAPtUnTNc0z+KTvQiSA2vx0smH2a5UObgxz86g9O7fOeRHWkUn
 eBAR9/Ijw9ur//GKCtwFMG2mtgPNyzG4MxIQ5GE6o+aaXFhq3Tgtns5plEDuzGoxzNP0alu/q49
 MlmZBA1gMvVFGUA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6ae9d1c7 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=aEXDUd4ZCashyi2nXeEA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: ulaoMN49vskty3zDb2rev9tuxEwwuMIm
X-Proofpoint-GUID: ulaoMN49vskty3zDb2rev9tuxEwwuMIm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX7pWqTh4DhPo5
 Ynxrzlz2+Vhg+ED7uWentrW5oUugpbAuRr9GVcAPMKzxaSxr7e6AVScYj6ooAMvp0LcAV5G0KQs
 RqrUFqFpB3naVykMwKDOVqLezlNpgx7nCBOBpEmO8HgxNdIHJK8BiiLBL2MiNRPbKUyuQ5v4orh
 58+sNPVLPLZHTQH1t3ySPsg6VYkII6VIrFapa347bd6Cp330uwz4th5lXg+Lpbq2Wh7r7xk/wGy
 TIxEqVPdNMHWJqFZfyrwH87g+MML91Bk7YVtNCZWwplbloizcNkSQ32ZrsHGP870NLlEmo/HiwY
 C0bOqc1ID9eeA6sJKcCsHaNMKEBIo8ecaEswCsrZ7uGDIwIInpVcigbPh29J+bmQD0gQd4i6SAH
 BiVdSt3jVUViKGdBo4JE9QFMcFnMd0Yh9fC1rguFPsQo3CKI2MM4rjhqT2ZN+jAmPq/RN9b838o
 Z/kIUGY68krTA3Jn4+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfXw21qNAVBRSfc
 owHrU2lnNUY7vHzqgBXINxMpM+4eoke3jqBTYkEURbtJleEfoSUCIfObOaGjPCIkctjY0jOqoGg
 YSixIQ4hKcchYrZzPhdOB/fveccyV7s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030049

If gpio_shared_make_adev() fails for one of the references of a shared
GPIO entry, the auxiliary devices already registered for the preceding
references are never removed. Similarly, when setting up an entry fails,
the entries that were successfully set up before it keep their requested
descriptors and proxy devices, as the caller does not call
gpio_device_teardown_shared() when gpiochip_setup_shared() fails.

Make gpiochip_setup_shared() all-or-nothing. Have
gpio_shared_setup_entry() undo its own partial work: free the descriptor
and remove only the auxiliary devices of the references that precede the
failed one, so that no device is removed that was never registered. On
failure of an entry, tear down the previously completed entries in
reverse order using the same helper as the regular removal path.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index c9500c2b904ca53dd1e3cfe1bdb921d767d18b3d..6b183864933870e54780715c4dd9179faf800d09 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -591,6 +591,9 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 		ret = gpio_shared_make_adev(gdev, entry, ref);
 		if (ret) {
 			gpiod_free_commit(desc);
+			list_for_each_entry_continue_reverse(ref, &entry->refs, list)
+				gpio_shared_remove_adev(&ref->adev);
+
 			return ret;
 		}
 	}
@@ -598,6 +601,13 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 	return 0;
 }
 
+static bool gpio_shared_entry_needs_setup(struct gpio_device *gdev,
+					  struct gpio_shared_entry *entry)
+{
+	return device_match_fwnode(&gdev->dev, entry->fwnode) &&
+	       list_count_nodes(&entry->refs) > 1;
+}
+
 int gpiochip_setup_shared(struct gpio_chip *gc)
 {
 	struct gpio_device *gdev = gc->gpiodev;
@@ -624,15 +634,18 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 	 * exposing shared pins. Find them and create the proxy devices.
 	 */
 	list_for_each_entry(entry, &gpio_shared_list, list) {
-		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
-			continue;
-
-		if (list_count_nodes(&entry->refs) <= 1)
+		if (!gpio_shared_entry_needs_setup(gdev, entry))
 			continue;
 
 		ret = gpio_shared_setup_entry(gc, entry);
-		if (ret)
+		if (ret) {
+			list_for_each_entry_continue_reverse(entry, &gpio_shared_list, list) {
+				if (gpio_shared_entry_needs_setup(gdev, entry))
+					gpio_shared_teardown_entry(gdev, entry);
+			}
+
 			return ret;
+		}
 	}
 
 	return 0;

-- 
2.47.3

