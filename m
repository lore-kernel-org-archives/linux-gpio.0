Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885473;
	b=cAMiZwLThxxKYoiLoASxaICgdC1HAFoWHKDmUF2DdZ93yO0qCEco3QVu04Qec1pcQaWh
	 mPvwTMh9GVH1TK19o+UZOojvcgFHNWAYJNlxzGmgLlhhGzEhYjxvXT2ZgZPHMojv1/NQx
	 0IdOjqp9Kr/+nZOtzWbIEPb830J3/JZWcFiHSKc2C0lvn52MgC+YwfPor/dlMT6fjloYa
	 gS6iPyawM/vqW/o1I/XgxpFL6wo9qh8cFL23WvTBcyFZUsXJgQUQzWjfnQTE+QEeamM8q
	 T/M/IjoeOegjqFnqIJGwXj6tGe2w9MZoyphk2BUeHOeCweQXsFcNl6wmuMTe6dJosKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QvBNxBniZKlP5d2kcfp20RqdHGp6PKnHt5QodKeOHlk=;
	b=Xb2dnJyL8SibQ8p4A2qrb0yMJjArvmyz5xlKyGUryozOk9H920M0VJ94Xw+2T1kXSyEN
	 A/cQUOj0+oSUo/m4nQTafCpWrzvb5p7gv+Dle6RskQ644tpwFvh+g2rHGZ8xJy9HXRKAQ
	 2zgb4LxYrUN5Lptzb7SCsTc6d2PHPzQyvhDfALBpd3mMEl4oyAzMfhhxOTcHvmifjNHa8
	 wSICoHkoFYF1PNmHVPwoeEeXRP+MP4D5oIi/V3oQlqfuOvxKKRD6pkYgtnuJh3vC+/AVi
	 pvWeDwIaUCv81oyTrHktFXHR5kLHuvVTjRZlItMR4Ywvp0XuUmQev/zDsw2lhi1JqTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F3zlkwE8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T3kGP1JQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFACF606A328
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 13:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFACF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F3zlkwE8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T3kGP1JQ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tKHY1053154
	for <linux-gpio@vger.kernel.org>; Thu, 5 Nov 2026 13:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QvBNxBniZKlP5d2kcfp20R
	qdHGp6PKnHt5QodKeOHlk=; b=F3zlkwE8Pd2JS4uqxhQdOTYdHPLMVL/TwG4YIe
	M1II3yxwuDBOay9mC3/SIND9L79nn0fO5b1oeO6VZLM2SNQwiVybSRmHLfcndmCD
	qsqZ1+C6kBEc9UXBrm0IkXkR5zfgnJZaMh3D7Ol2S0spayrUy5Akz4ek9vphwmaR
	OaakvvjZlQqQCINImxB8wRDZCISU2KiGB5JnHufo+IFaWGEQq8huNH0+a2rdiut5
	6xRXn2BKa3BFkZhMeBF9mhXk4VhSL4zqxv41Hr1IkhWQYznNvFNAAbTTNylAURQz
	Z168LQvo5ZFHFqdigDnNVUDBnirGhvl7SAoRR9D8pIM3eGjA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq9f8xga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 13:31:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so473645685a.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 05:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793885471; x=1794490271; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QvBNxBniZKlP5d2kcfp20RqdHGp6PKnHt5QodKeOHlk=;
        b=T3kGP1JQnJ6poqn+uHrhvER9Uztd+EhZ861VDI8tZLcsklh9EqvmFkvd0EH2cCylQp
         7O1RJZ+FxTXexwndgIs6rFeBGBwqEDq+CApE5JEyFSwM35CJYPOS731nJ6uJKB2uyswN
         t7zZU7J8ucs9afGV72wLm8uIF9850BbbD8JR+HRTesyHpMJ7XnGKWMJHOPVd+MM1+cMH
         /HEWLOeCH/g5n+nncCOHfTv5Y2GzwHLytBKO8PfgYB0kNGJAnpbbWwKlx9pIbAl0n6KE
         E0CuItK7cpJaW8LefdSF7W4zD+fpmlLC8DbGNN+Jp0SXDi4Q5lIXRblSw7X6Eo6NhGYh
         AuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885471; x=1794490271;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QvBNxBniZKlP5d2kcfp20RqdHGp6PKnHt5QodKeOHlk=;
        b=o4FtMX64qP1TS+Ktw8DXJ3VMgv3oiu4n5pKlnH6bL5c8soDTU/zk+t33EbgcKGQXoh
         fflXV52HAJBskYTaxLViw1ojaPN1YvTJc5v+laPBCpiJOVd5ihMS3zlpI0FP98+uO20i
         YYjHfHr0FP5CnHguGTiH7jRTlwoaI7AWlNjnP2iAml7ZxuwHdJswecwk6qhd0YW/7KYd
         42rRlq8KUnTrHHHJVqi2YZ3gAyhuEbFIk5FD6CUOBEdui6hch1YPRO5u6CitpAbNwOme
         t5TXap7xKDvPidUwDY80K2xYVIB67d2MwU3SWI5EYfI9fhOCSRfY1TqqGXzx5i7vQq+k
         ZNvQ==
X-Gm-Message-State: APuU4Z9vmLaO068Lvck5WMH55+FsFxIbco6jxV1BRFDILFtc0+aEchVX
	FEEirW3Lrd07PHawyIXZI8k+lOGEjvRmQzk/qTPvS9hqtmq+7cJThIpulrGS6lgiig/hlubbH70
	5+sv4PXNb599bgR+pFif/kKHJZYya0zw4SiyQVdV1L1mV9JiSeILqjR9lwYqeht4W
X-Gm-Gg: AYBFou0RhJx4yG79fs8l/KUaGSgsZby9V/BuOUVz4zEisizKbKB9BVK+THsXbtFs4fq
	9wQ8x74Xp2nghdKVklZry+/UVW1O0zu69zOivX2lScsJvUS+RWdpcCcPvVgHAJveNZU75wbY6tq
	PU+jFFfFp+yPYK6s1+ziqSFW9apiSzMfVQgXUycCrl9r6i0A/Lued0407AmQZMWoZSnlKD2+1/Y
	LL+Rs7ejOJT6r0iQTkixTECSz5+KxVlIbNmLWeiF8OVwhG+XBOKHq6VTX/WqEh3e5AgX9R4bo9a
	XLv7KMsrn/KPUXdTMTL3c6AfsP/ar0Y4noirBPn7k2ld7UbMlp4y5hheh/ryQAjZ7EjySQEU3H1
	FOqKUPLFcnvm2+eQkrA82eKxBZXQlviwSDaBL/EUshQzZv2h6qIjf/BS89JrM9AgxfPtHjIoJ5v
	WFUg==
X-Received: by 2002:a05:620a:45a2:b0:93e:c12c:f131 with SMTP id af79cd13be357-9442180665bmr3079126485a.76.1793885470933;
        Thu, 05 Nov 2026 05:31:10 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:93e:c12c:f131 with SMTP id af79cd13be357-9442180665bmr3079121085a.76.1793885470323;
        Thu, 05 Nov 2026 05:31:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572505e84sm63292005e9.6.2026.11.05.05.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:31:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 14:31:06 +0100
Subject: [PATCH] gpiolib: fix stack out-of-bounds write in
 gpiochip_add_hog()
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
Message-Id: <20261105-gpiolib-hog-stack-corruption-v1-1-a47af9c51965@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABmF7GoC/x3MQQqDMBBA0avIrB1IrIngVcRFTKfJUDFhoiKId
 2/o8i3+v6GQMBUYmxuETi6ctgrdNuCj2wIhv6uhU53VWhkMmdPKC8YUsOzOf9EnkSPvNcT+pRf
 bD+SMsVAXWejD138/zc/zA2ZN+rNuAAAA
X-Change-ID: 20261105-gpiolib-hog-stack-corruption-431b647ea556
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VaSatjKhIucK/x0c2+EFH0QePD6fzX9GOqoaXfy2lXk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7IUcYHJH1NTLw9y+HpKyiKHCCa9HhnnUrok9C
 T1ttopHudqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauyFHAAKCRAFnS7L/zaE
 w2dJD/wMYP+cetabcmRqmrV1q++gULqSzp7XbH6neqE71XRuDIm0RALCLnjzcABPm3QNmDUJGP+
 wtQ+Ixfr2YRh72IdfDEJ8n4JehLopV208L7cvcD18PYy/oyw89r+W2yzompQ/wp5epxYAyYN7bm
 VbHG2zEM8BVIcudwP0NEnuCE+8YdRoAm+EDs7EpbfQZH+dwCkdKanvTCacff/80yeG/OT1lJfE+
 fLxRGHV4Ko3u5ISzcNBpJbNm0TgR95q5lwrq4RoRzOFDcfd1AC2o5oMKDQtG+lEx93DNRmI5SUy
 wd3DAZ6vQ9zYIlR5pXryfwT0VlH1X2t0uW04jdvwmShAhls1mxOPx0QJ8qOvQu/ZyRYoMHXQbMc
 8ZmCzBqyNm7pW7Aantl4cQeWMyazM1L6YIVVohs9muedW7mDGlRWKSzi7h3xMhncyA2GVKD2OIz
 dXGquSRhEQUxCTPioUQaFtHwCx5YlY1Qi2iN8mwQtJDPdHzyi7nppYIb+liFbK6cMdjLnrgLm0U
 pkSBNgG8Gzcdcj4YgEZKQwpxaUCDdNaMTTbdY1gobD1zh/fyQdIcoJ2KQdoR3GNewmcadOcyKuU
 kYTYYW/xp9ubwUJs7cMRmGHAiMu4fD8XNh3fZ3rPsbYcXEKu0ypD5nSIrSXTNGGq84MQEh8VLgu
 j7Ef7iwfrriVlZA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MyBTYWx0ZWRfX2McLxYNUlhW0
 AvvgLWy+Iq+WKRLnd4xsJVZ+FJ8L+7/YsHB34KExiKefxq22TS9kTDE2fP0Hglj/U2I5ysoPtNV
 68XjhMsyx4AEj59ui5+lypHoymzNEYOwcsI3JEbZL1VZEdYdtEJ4mQhXN+tLYfcsy6M8a8O9q5T
 eGfF1cuJr1qMtNu7qiFPCwVGHKjct7suugYoLMwxEGwUGqoCYnH4RMc+CQYuZZyc+YIAla8lZsb
 u509PyM7DrBbjeRBXaq3gA4BGK4zf7s9RoTcU6bb0S3QP+gVQtuhP5ly4zJaXeUlqcuzp7oaebn
 Y9RbOLNJIf/aFAER8S/kjGj9oAt51FN4anLHn4quYb6qCpu3QfkB3TJxp0bhBTKmejFFqrxIpY9
 NcmlBMc2zHYbp1bAqJChXjWlKVRKwxMeM1jHGii2woyTC7oSVHsHJ6c+YV47Lch2LAzFkJE/Td9
 sG6QuLPZqmMESYe2Oxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MyBTYWx0ZWRfX7xf/EBnW4eU/
 bglctW/vSPzdCqzW0Bz4r6T1hJGBSHzASi9W/ekC2KH1qgtqZZZLiz7EnTv5mE5z73Lgt/FnaXX
 c1M3an8JJDqhqhcFXC5ZtSyDQ+Il5dw=
X-Authority-Analysis: v=2.4 cv=Vdhir1p9 c=1 sm=1 tr=0 ts=6aec851f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=it0pbt-dyIlpk3O7H5UA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: 3tyECwEZoOTUFo1utMHTBJp1WuhXuPD8
X-Proofpoint-GUID: 3tyECwEZoOTUFo1utMHTBJp1WuhXuPD8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050053

In gpiochip_add_hog(), parsing a device tree with an excessively large
"#gpio-cells" property causes a stack out-of-bounds write when populating
the GPIO specification.

The value read from #gpio-cells is used to copy the values into right
places in struct fwnode_reference_args but that struct's args field is
an array of size NR_FWNODE_REFERENCE_ARGS so a value larger than it will
make the loop write past the end of that array.

Reject #gpio-cells larger than NR_FWNODE_REFERENCE_ARGS.

Cc: stable@vger.kernel.org
Fixes: 802c51a83e9a ("gpiolib: fix hogs with multiple lines")
Closes: https://sashiko.dev/#/bug/linux-fdec1c0e-c6e3-4eb6-8746-d68a3f951374
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f278713a47c2e3d2a6640f387f6d92227..698f86fa14591be484f36999e9b578cb4946917e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -986,6 +986,8 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	ret = fwnode_property_read_u32(gc_node, "#gpio-cells", &cells);
 	if (ret && is_of_node(fwnode))
 		return ret;
+	if (cells > NR_FWNODE_REFERENCE_ARGS)
+		return -EINVAL;
 	if (argc % cells)
 		return -EINVAL;
 

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-gpiolib-hog-stack-corruption-431b647ea556

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

