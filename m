Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178837;
	b=Uk+D23WEwMMoYdYEwCr1KGWqLv6ON6bXRlmJzZZic5tUa5RKkOdbVd47d/qkzNxEplFD
	 nE0wSqNx8DO1wkbrR6kXqCTA45Fu3He4JwjCsnn1HKx1obkQg6XUar6JlzclqHaNcZSZ1
	 1i1Tve/zjZtKjLHYBaZQzg0zUgR3Td4uX8VSVHPGlB/K6MIDCsa4oaTEMuP1AwpN2qAcn
	 w9x8muvQi20sNYkLNaAAHwIJ5EEftOugFLpOtcjpLtvQd/7EI7jn0RSQMuqxedpgi1y3s
	 BhZKEwrfxfdpct/9KGSibGo6+7WCSgf3DtoorFA6/X8Cw6Xx89A1RkJbUr5DyuqbpcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZYge9rMri5rOho4JnKSUT893vQR9YUEUOAWAOacrx48=;
	b=WeIllzefmf9MyR6Btq1m+3xSk5jdO9tJg7xK0UWLWruybgVwH6Bo2D32SfO3Ev34ae9l
	 r5z/Id2vOG5L94fTiVZm3NfmG2BWcSlKdSrLHQfp+B8dQeKAerYssjRKwWU/EXRBofdqI
	 LiF0UtiGaxukbvXoho4OR9NbJxxy8geifYW4F4a5e4kd1ffGrp50lmSgQ9VvSn8iZrTdy
	 m4MtMTfVJ4awrXEv4cwZINYyhux7O6b24r2ylkHbYhZvbsaimOn3BPluDFsb9ifScg3ie
	 OIzOfp47u8gSiVDoFNEUc3jeQb3L9rC1pPXCyMrlKftHxlANk0WbJARDwZSRVeMOO1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oRZVYadQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UiJ2rWbA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA191606A32C
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA191606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oRZVYadQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UiJ2rWbA
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk0vc1060622
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYge9rMri5rOho4JnKSUT893vQR9YUEUOAWAOacrx48=; b=oRZVYadQvCYWx+Q6
	Y2FThl0ba8JhSx7ZZ01sfsZ15h0Z5wT1EcyXAp7GAgEGAx9eRti+oc5Oqlcm+xto
	zajaeD1uOMFymuGWBRC/C1Oe7x4Gq465BUxjtsGFfF2tn1ZIw3rwoyF1OaMJD/24
	zeW0jgAVRzLmoHn0Y05pFlhEcdn/IgIZiPk6pLHQSyUTLNTQJI19Q4kSTS4qWxvB
	rC9Y6xOz5XT5Uvpp0k0+/5wayztUdGnKX0HdSuBM15gBUI7rRSraJrP+ZfWAM8P4
	kVo9hLo4o3T/j0LgUDtonVYTnrQrs6OpFYk1+SD2O7CkVyytegXedpcAlDSMKKy0
	iL+cgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykr17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:47:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so191748285a.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 04:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178835; x=1795783635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYge9rMri5rOho4JnKSUT893vQR9YUEUOAWAOacrx48=;
        b=UiJ2rWbA9l5L1Ar0gbWRDFhQMr89/+wYL+8a5o3Cp9ZBpFFI71e/AupmpM+fR2sjed
         ULIJfRQ1FOyWe7FLa0Hs3QDvbfYCWHG+zmrG1bZAwxwl6ut97J5sUPMlniMtVuSae068
         HZ8CchgMWOPTwCYWFmusL/a90eO6KtFTqc51an1bUqmSLRSls79HbVZ5KNFV2kivXLh2
         Hw5c/diNSekHiMDnR5/v/BHW6Gfu8/mEb6N46B5kBnveYQS4MLR+Y8tkqCDJTkdOG1v0
         KZzTUSxrKRzfPYT2hCASnSWdg+06yHMY3npsckFVnTrkyDp1tRjnoYQ12/BHmEHZR9vL
         Yibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178835; x=1795783635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYge9rMri5rOho4JnKSUT893vQR9YUEUOAWAOacrx48=;
        b=iMBG/3VJVsfXvY/vR+hK9g4ifQ33LPSEQkH89k9ohHXzwZvSQrqQjnpOdJOhM65Dw7
         OOVbI+fU9T5hx97EwGtOZrRhYA7fE2xeG6lba4d82aKUOoqNnAhUzk5Y+TKJtKIu7hZP
         d2B7UWV36OjD5rGlSHS3YRe56QiClk/VQc2gHJuS1c15hu6HF/0/Bk46OSWnXT3LHOLW
         veKqTVnN2UFqkCWwYNlQSZXhO2E1KlGFktd1Uf6eb4/Q453MxcyOURaKUDklt8HWpL+M
         mdEvTQooVGOdMnIiuAKFq23tUBrVMa/TdE6WkBpIR/Klsjfvl8UC22RHq3Rbsmlook3t
         94tA==
X-Forwarded-Encrypted: i=1; AL+hErFM+ewWhIL/bDqTFgQvk/p8XgjK5sn5sRVlEOWHMH45BhbyVBrM/0vWES691RdcP7f+lJa/gMZcaopr@vger.kernel.org
X-Gm-Message-State: APuU4Z+Tq3IVm3/vdLdeMdZYPOLvWJLrXgE/iks8UIPBWNzj7Ww20ybz
	EvxsCaFuZ3rYLy1A6yv6MaNrRFMYVMahS7pevGYIdKsc7kGI1zsVvmchkRNKq7oIIBjpXs66FX1
	N0jFyqd6pFgjAOA9tFmbXlc0tKW2B7+U3BVJP1WspfGUL1kiLv1f8YfRwNE/ZlLEG
X-Gm-Gg: AYBFou0DzY+6ATv98G2jvB1cqONx7A58QplHJjYjfc8Xj+UTXWf1QhWZGJKyHQXESxq
	Rp7Qu9F0w1/t4wPEYX0ocsMqgaz5IiMxIsNzIULCYSYT2b2/9ROabdXSRpjuOczmDX2MRPL2Dwg
	JTwjlTAzUUhz63UOTcI8ddwwFWAajZyYUO/TKoFjr2xwER/NrGkRiLdNsALsGiB769DwAXsgulj
	/r+qpm+0xDPZSznxiknc2BB3SLgVEzKgstOPPLtjqNN5lPqlqA+kk5t9r10/cIsk2rd7z2WghUd
	xO8h8HvIqutxN9xvgp5ToUen/VfyYlWT76zrfs3S3xJWMZ6HpY29PLOC5cM9K60PY2+NSpMwmkC
	d6jv5ynz+v1DtNwY5xUaDuGg33+rFlCpr+XcLeDgAvHQa6oTEnNHYCvyoia+eufj9T6mHHetUUw
	I=
X-Received: by 2002:a05:620a:44c2:b0:93e:920c:c00e with SMTP id af79cd13be357-949ba95e5b6mr485703985a.21.1795178835212;
        Fri, 20 Nov 2026 04:47:15 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:93e:920c:c00e with SMTP id af79cd13be357-949ba95e5b6mr485697685a.21.1795178834684;
        Fri, 20 Nov 2026 04:47:14 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:47:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:46 +0100
Subject: [PATCH v3 09/10] gpio: shared: remove unused field from struct
 gpio_shared_entry
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
Message-Id: <20261120-fwnode-for-each-prop-v3-9-808e304dc73e@oss.qualcomm.com>
References: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
In-Reply-To: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LlJfTzXZqPhPYiFBMDDbJUjl6+Z2YhN3yTlXo0CvUjo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE4fvRJL+ZveX5BmMRTVI0xMZXr6Ij03Kqcz
 jdiUFtIQN+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBOAAKCRAFnS7L/zaE
 w6TaD/9Scfa0Lmv3m8Q4KKZfDFfFDgXcmFCrRT3z4OcdVe8A+4n8W/PM7KmtlLSNvizw33X9lbk
 mW/EaCE5U96E/gUBeaJahtpbIA06luLpOEFoJbJfBvfVjUf8bnfdqxobohQPdIH/q7bvW2mctJo
 LrjxB4o0+fyOYN/Gg10IsxUdPRIZ9sJamZKv7FEjpp1pAf0nXqcxkgHKr9GbRdoF9X/BRGqpdWa
 7hANJwMpl0EWcrnNXtLmuCGMRkNMaLMMAN53S2dd1jj32u1f2/od0+6wDeaQSo+92qT8Kuhqcsb
 IGFYcjC5vmM5QpEYJXYLJTrC2LmyTMD8DR9u2uMLAKRzLsIzoGJTERPugK5GXLwlKxy9C/1cbaL
 z0FEBUgnCNNwvpx7kKOPrrjx9qFZxitecrMayh0j6zjvdCjA708U4+g2Q4vSFirHZW9cV9ZAyN6
 Mc5TQJIk7SssKkq/WqApM71Qxai10+7XrESJqpuo1+SgpbrOFQKt9Hm+v5mkbTpiNOJEYYJyw5W
 bNM+gNibRYcy5Yn/xByAholEFTCaUM2wW4B5ALp77np0orZoIM1+IpHNHgowTnvPoIJ9Jsx4mGU
 cGVDNZ7ME3DcWYzrDdY6G00mCyHww+XJXkAX9lELkyhz+9YAU9z583D1exdDcNZ1gNXZ4OwX/kS
 XykOGXolGEzkWbQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX0psaFy84/fNJ
 nTwWHuZ80GlnC3kgwRIr8rzbYoe2SAS0nDraPeT8G82nm0NMvhj+pVf0xUydrEumQfT57TkjKKw
 HpMpcKw57TirLIqEBmaeXL/oiuVJ6Rg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX/r8LEmTTHwHl
 zhhwIIIL8Wp8ODh3QskBBLVwdc1pNdG/PeqzL1HgA2WoxzPKwAUWpes6MAX01xFbLW20c0PfmSO
 G9OMqDQKBhXq8z1aPiSrpS7Gt9R3m8G+bLq9GSLmsp2EMsj6HcmffhQ7fU1ZB9RX+mI/hguSaM+
 O4Dqd8IbFDcAMBCjSEscOQ6o5a5W2eZFy4xtZkffRWuDsZ7c8xwg9HjS9+97wQynnialfkUT4Y0
 vhud+NHjvV/GV6MqIHEFbxaKnlNxxt1K1UqBWVobGWzJyFD8L7dmzJASeNFAnFk5A4W2WDJgxZO
 c8aODbzQrqqd0l4sgWgJeBXHK8ksf/B1R7wTPjE+fAFDsSaUgxp4z7T9I/FwQQ1HHUXGR+kTE5C
 vCTGFLBFuBn2Gls/PkmvIV9gmVCvujeNwTDOxwJK86sIjJex1+Ezunqc61l4fu2rogVidIPAVlO
 7FQZKIeYIjPPZUyvz1g==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b004153 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=AZKRSRgWbs_cT9JdyuIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 1hXjxMjmwXxfxjfvW3hqlZ6jDIy07Gaq
X-Proofpoint-GUID: 1hXjxMjmwXxfxjfvW3hqlZ6jDIy07Gaq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200050

The index field in struct gpio_shared_entry is an unused leftover.
Remove it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index f0e3edf07cf1a677a58022f8d76cdd6babf1c655..fbabc1ee489f881084033f7b92b42397455f5811 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -50,8 +50,6 @@ struct gpio_shared_entry {
 	struct fwnode_handle *fwnode;
 	/* Hardware offset of the GPIO within its chip. */
 	unsigned int offset;
-	/* Index in the property value array. */
-	size_t index;
 	/* Synchronizes the modification of shared_desc and offset. */
 	struct mutex lock;
 	struct gpio_shared_desc *shared_desc;
@@ -228,7 +226,6 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 
 				entry->fwnode = fwnode_handle_get(fwnode);
 				entry->offset = offset;
-				entry->index = count;
 				INIT_LIST_HEAD(&entry->refs);
 				mutex_init(&entry->lock);
 

-- 
2.47.3

