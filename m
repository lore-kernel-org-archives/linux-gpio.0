Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585909;
	b=fq+p/Yz9jXSPw7ykN1FCu7EbbxhpE/AmA7OdXo+UCv+JzNr9a3fCc3DAhKcHnTYffAu8
	 wXsxK1gGSB/Be20r9gyO6zxZOeMabFOxDWSb1TqRpa+QYfQkG0mIcftGRwqpFnn9r8aO7
	 ZTosnaLya1n8KQ47IE1007JNOUlyYa3dJUVFx1LuGbwl8GJkfsfTX8ioeavgbdCgKKcP5
	 h2pJcPPS83GGzHRoSDM63lSRGFeq4ZA1JGa1s1BJV4/OjoPmIF31ffnrlSoXHf/NwBxKa
	 UuFGIVIi5wiG860ZM7TdAwL9O6hvVBGzcOkGFt1jhw9ui8/oGe71y/Nonhaq9EKzrOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WbqwEg4uriAOxuSoWSa1/zg/VGqHBjEoAgcLsd/IJdU=;
	b=3mc0poBG+g1UlwpYk5ZSpPCAn/2nnKlTIM36ifsmLiVIeL3/hehLegzIOK1w2El18n/T
	 +/Xtinchf75KusR0+co6f+XA8RUnb7Q0e36luqWOS7M/1xDtFBRV1A7n76kKoWs9goomL
	 PXw/pfFQbYGgfIAtOYlGzKSgK3bR6NTo7MIdv/amCHg8W4CgrNRD/W3za9YtouuqOV2G/
	 8v0Su4Tr6AWMQaWGsdc1Q8wgb92BMKzjQdQ4De8QtdaAWO6X4F1WlUr2tXoUp3Mf5ujce
	 tm9DlX+7lGfNqefAVVGazLdsdRzt50TkGF9A+tOro6uDFtUpdlth7SoH6Oty5nP9eGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UrS1vvNq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jE23Pr2B;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1134606A31B
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 12:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1134606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UrS1vvNq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jE23Pr2B
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg3na3224847
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 12:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WbqwEg4uriAOxuSoWSa1/z
	g/VGqHBjEoAgcLsd/IJdU=; b=UrS1vvNqZ6vkYKEcWRZ0iouif7we7w2poH3n+j
	8T5pZ/Aag0R+/gIQM/RZTPrrxdl0tB/bVRvUXfpKIJWO/NWeoFxmacrD0rXJpb1w
	rXorEXGDrc+TFrDcJ+O0aNgPG8//gBgFk0OBqPxqgQ9eFMZ+6jTJ66mVV59nY1ql
	H4D8qlKsTJpsFnur+oWfTf4zuRx50/4tmHNXX9xvKYmsN/cncUzO00zi6z3OyAsE
	7vCBDjXIJP905yWOicSa0xsbmI3/vfBA4IW6ye6R5Aw9DUIlXMppk0Ow2Ir6bWtE
	4NdRRoypXyfpZ/V/3V2A1axprl5ab7KZZReMEtfgvL66/U7w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy790e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 12:31:47 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c1a2c3b118so540523137.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 05:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792585907; x=1793190707; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WbqwEg4uriAOxuSoWSa1/zg/VGqHBjEoAgcLsd/IJdU=;
        b=jE23Pr2BM286k2VRMufc1z3H9HxurGXKi8VV292q5UNCi3TFmSYZI/dtzcyaheenHs
         jROMqG65pFIQFFcw+/04/UTTdXqUTm0Y3KJ2XTF2mGG1VE5BHuiTAEDvlLeW3E6MC1Ue
         aRSB8WTTF6sjDK6zIPu1tgF3J/rquYMOGlPR33kTkEkDIhL5Zj/oc+E7YsgtvaKxfFBF
         8rocXSa9kVqseiqAblrq0ivKO3w/bDWh5oQa4SopwMEhnM2Pr/61bsLoeEQWwSl4u0Lh
         19foYu4C215nYO9k+4RZcCPNOoAsorucGzzjRxoDyBW55zzsVPZC230bbb+atRMUrfUE
         7fJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585907; x=1793190707;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WbqwEg4uriAOxuSoWSa1/zg/VGqHBjEoAgcLsd/IJdU=;
        b=0KarJhH0W4RFrjg1nMYCDDWGj7pUyhVyOEHf6zjMBUt3z+8sQL0C05qM3JfOOBpLtk
         pHOsrc4W0gjvDDGx0eyztZXM1AizTAoIcMoDQUlK89WpBb2vi2/f0iq24YMrGgeD5BnT
         CT90oZfaGzfmU689j8F3QUaJOqP/7csYdsxz9Vite7ERIqO5O60Baz+nyAkdp0brNuJR
         RZg/85wI6rd0nhciQ4xcCbR9PRMO1O2L8+d9XuOJv+k8rntnW51XJSfm7xajUOqJ16SS
         yxdP4hDcIDdusCa34MZ2aiPGW62SSnqf8xVMALk5RxdhmeLwYFVm69w96PEyAafe4ICj
         7aOw==
X-Gm-Message-State: AFq9FYLjirTMxC6iK9OevXUp/CP7TyjqUU5JWWUWEKlWVu6uCHuLB2vb
	IRA5uHhxY3GMAaDQCKaWn+lvL2C9J2wDn2ypQ2OD5nt5rMD1rfKlJIoc2owBWo2F34gACQxh/wG
	vnBWffhDrVRprqG2xyDx/R5nwABw13GSJ4xCjnT7BKHdKPF4eixHYw+JEEMiszek4
X-Gm-Gg: AYBFou3xNM3mnsN4ZwI0d8/z3zwaDYFiGDBUExLQxPO1yagzwTb1OiaI5xsaj3G76xZ
	e5U5a0wJYNR40cAKDjsAFgKqG48M8zgc4GvwnWCrffBrhljJ/ZAQA+N5Kjr4V9VhJypgikb/3aP
	3zFjDfEcMUvYe5R4FjiqVFV/EJydOeKLAW07TBzjwrg48yyb8MpNSwGMgPJAPF4Bblh6aVUpcjK
	Bjf4j2ISRJrryU9hsMGbN4hcRiRTQA1NK5GttxZmwGiCuY0riErL4/7ZVDCQr3VykITQTU/OoJ8
	OvQ41c8jip1Jq+HlUKLRZhpyZWS5igny55uvO84/kYMEovHbf4pKxumczuM86zj3fEDxC3AqXV6
	7xSudGPdqSZT2rvk+ufW7/jAqgM5p
X-Received: by 2002:a05:6102:a4a:b0:7cc:2c52:47aa with SMTP id ada2fe7eead31-7cc9224b4cbmr775104137.0.1792585906891;
        Wed, 21 Oct 2026 05:31:46 -0700 (PDT)
X-Received: by 2002:a05:6102:a4a:b0:7cc:2c52:47aa with SMTP id ada2fe7eead31-7cc9224b4cbmr775092137.0.1792585906450;
        Wed, 21 Oct 2026 05:31:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828caesm4933767f8f.29.2026.10.21.05.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:31:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:31:41 +0200
Subject: [PATCH] gpio: aggregator: constify struct configfs_attribute
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
Message-Id: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKyw2GoC/x2NMQrDMAwAvxI0V2C70NB+pXQQqaRosYNkSiHk7
 3G7HNxyt0OwGwc8ph2cPxbW6pB8mWBZqSqjvYdDSeWWU8momzUkVcel1eg/iqkEUu8eON+zUCI
 hpiuMyOYs9v0Pnq/jOAFLiRYWcAAAAA==
X-Change-ID: 20261021-gpio-aggr-const-configfs-attrs-791fa0afaea3
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GGNQ+1+orONooRcQilPyAAvS5ifjySAfgqXH+Vyi5BM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2LCw+L1fo2lPEMA4YWW04Oj8DHtGseGN8AH6P
 bK2t0EtncSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatiwsAAKCRAFnS7L/zaE
 w/uCEAC8boE0PP9MJKGq5k7d8QP+PpdLUvKbY65CdSeAyWz4U61sXYvC9X5onR6T32fGjc07KPF
 I4QuQESgJiQPYdXXg6p0ZOvznV4CrgCDo9v4YD9LRjAtZcXJO3GE3p/H04rQErAqzu1T/vY73gf
 pMqZerMm6fmewMmI8+8sIs4zxvv4HtnFGb6cP3qKj2lWFLD4jca87L6ee8xsR/P3ReVuc8HG3rz
 KHQYa8q6jFaHyWNtBSb4FFgX46xWVbx0iicKKhfejkR0YmGKE1Pb/8zaZdABjeOtwxw3m5NR35U
 RYeVr4nVtT/DuSEZ2VgcaT/gnh9VRhLVHJmdCp7HVve6avHXiViAXg1yBhdnf+jnfNnmyRyU/b0
 ghcAIGLTw321qLXP0wNjtDuxKpZsxN35ezi7TwJPFpf4Wvd7PLZTM5oLmqS2SAwuYNPujjbOA3Z
 ceksu14Ec414WGc4w1wxqw7oYHcPXhGYRhqWVZQCpZ8CGWx+YOBHnSbm+SVu9zuauqLtkSlw3um
 fvIv1IHJaNjNRmAqdhD7HUYNX2x3LriHXgtue85P8GIh0IkG7pg9cqfVVenWJxL2O+aXndHGRxk
 CNCHhETgjU1pP+ASr1PRcjx6/IKBibhhf3YagLinwk+HSE/WRussc1m67GjOVkp6Ym83TvbDlFE
 mNFyUEWAeazYiaQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 4hM3qdI2x9x57-o_QnQSl0ToAuuaU-wc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OSBTYWx0ZWRfX6EzBIvavhoBe
 it47W8ZXteLbYqeX/MSxdsQ2ACwOY/L+wSGDe/Wpjd/b4buVY5zljWuHNwGyjb6d/gVD63rCCUG
 9buGd947S058l2HQXmlIK7FHlS6O7YRyN1ZYxOuyIdZob2gn/iaJIHTyDnhrx1Lk7RrCuS4rADK
 T90+F1XItvcmJ8rVYrzv8aeg9RavU8tPbzeRB26L8R1zbkwGlKcPszIUeUOX0o01ka5pfQ1NmLX
 J+PWnW25MQgbbkwpQRgkoa6hmdSKJXMppd0JpAI78shFskET8v6wWxM83GbmAg0VYW4tJtp3kez
 uvHF41nipzq+wDxn5DcnWhN02QCo7tfv8KDVv2IiBALcqXdmbIZLVznIjT2o/uak3igNR4Num5s
 PMT3CIC9FaJmgxPw2oRUujexlJuI0o6lITZElTbbRV1bkknckAu/y5w/HPmGm4P40v/Sx0nhgsp
 ISkuaJt9ULYgxE32KSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OSBTYWx0ZWRfXztSFb1XuHzl1
 OhwPEKOW4DeZCo+cJpa8loR4837Wr/PvmElwYPuwg2mT2FBIBWmffa854RY7IBdWRD2CoqPaIX6
 njehERRxd3StE9XW79iv56959W5LLGY=
X-Proofpoint-ORIG-GUID: 4hM3qdI2x9x57-o_QnQSl0ToAuuaU-wc
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8b0b3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=54L1yxgrCAR3b_WlaP0A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210049

In preparation for the constification of configfs attributes, make the
existing instances of struct configfs_attribute in gpio-aggregator const
and use the new st_attrs_const field of struct config_item_type.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-aggregator.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index b0b65416d74dc13266ff3cb23e1b1f8fac1b892a..be9cc7954238da92cf769bc290265e985c7488a2 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -1147,7 +1147,7 @@ gpio_aggregator_line_offset_store(struct config_item *item, const char *page,
 }
 CONFIGFS_ATTR(gpio_aggregator_line_, offset);
 
-static struct configfs_attribute *gpio_aggregator_line_attrs[] = {
+static const struct configfs_attribute *const gpio_aggregator_line_attrs[] = {
 	&gpio_aggregator_line_attr_key,
 	&gpio_aggregator_line_attr_name,
 	&gpio_aggregator_line_attr_offset,
@@ -1222,7 +1222,7 @@ gpio_aggregator_device_live_store(struct config_item *item, const char *page,
 }
 CONFIGFS_ATTR(gpio_aggregator_device_, live);
 
-static struct configfs_attribute *gpio_aggregator_device_attrs[] = {
+static const struct configfs_attribute *const gpio_aggregator_device_attrs[] = {
 	&gpio_aggregator_device_attr_dev_name,
 	&gpio_aggregator_device_attr_live,
 	NULL
@@ -1248,7 +1248,7 @@ static const struct configfs_item_operations gpio_aggregator_line_item_ops = {
 
 static const struct config_item_type gpio_aggregator_line_type = {
 	.ct_item_ops	= &gpio_aggregator_line_item_ops,
-	.ct_attrs	= gpio_aggregator_line_attrs,
+	.ct_attrs_const	= gpio_aggregator_line_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -1315,7 +1315,7 @@ static const struct configfs_group_operations gpio_aggregator_device_group_ops =
 static const struct config_item_type gpio_aggregator_device_type = {
 	.ct_group_ops	= &gpio_aggregator_device_group_ops,
 	.ct_item_ops	= &gpio_aggregator_device_item_ops,
-	.ct_attrs	= gpio_aggregator_device_attrs,
+	.ct_attrs_const	= gpio_aggregator_device_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 

---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261021-gpio-aggr-const-configfs-attrs-791fa0afaea3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

