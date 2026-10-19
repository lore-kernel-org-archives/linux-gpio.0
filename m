Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708F931E834
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 10:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406998; cv=none; b=A5em1P8wrvcvd9L7hQ32IAjEzuKhvX8zBOX8h3PGH+HpGHhb7scAYfNBgKtuo5jClavGYFLGID6Ocv5QT3ESrs4OBZ/6j+7xtY0cgOeAxO0f0DUOGmx+HBUZz3PiJDHGirqP41rzT71+5snrH8yQYCVlO7ZpRXWFsRzd6DRa80Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406998; c=relaxed/simple;
	bh=OpIfYGjwvWanOMzKl0IJaDsblD+LeWcNFqt3SwKwRnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G5eyWKjBRDcOq2xZGc5Y/5EjMRaaSRFKZft70Z1aV2MAQIaIwMjUZpr83J8fc9kzl6tACFzV2Ahw/et7fbwllNJPJY2uSd5TByCf2IF81UzGLSQmHZUnFuH1bgqQxP5Fa5S8EOyDkGoPYcEujTU3vSY0Qlc2722MwIjFkXb1tBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6Qta8UF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQ3Ij/Jp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6Qta8UF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQ3Ij/Jp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Orap1167946
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 10:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ixXn3fJnfeIAIim1RNqARD
	vvRNoU3yKYgaCFheKKFyo=; b=Q6Qta8UFWGLQjjMKvXJDzpBwT9ZOy9GMYVlD/O
	kjkZrfPcC9zOcjxF9LhWqcvryetnfmgJyFwd+R1kaBHSBEoZex5QkoySZDry5JQZ
	E/V2JOC1zFJQ/yOE3uWlIYd87Dhb4JeDg8lWKvRftIcOc3JorG7hwqtjiA5UxSNx
	Lo+rVxg0LiCRC5gAtEAvQJ9kvnJB7GRQ18YiENlJ8eQVA7N+E3jzrrmbcqGBoZZS
	1x8m59UAKIwJEO7SLy3sa+/1IXDyMO5enwybL9JsA355jcbfOupeBARLla17AJd1
	MsmpeN5dnjIDLcABuFnDaiT50A+GoUHiij/TpazeZuKligWg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c8pau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 10:49:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so391999985a.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 03:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792406996; x=1793011796; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ixXn3fJnfeIAIim1RNqARDvvRNoU3yKYgaCFheKKFyo=;
        b=hQ3Ij/Jp7jJrTeUn/C2Qxnofe/A/f7ieq6Ea09fuCpabd7tn+vymc5t2WK0sqy7Aae
         E3OvkaNrhWZ0XOokaOkI/VpcJJDiAh2IhCX+7jJ8hN/agJSdj13vHc/hT4S1yUlPyunU
         sDlIbqJOkxeM0UKJ3hlnuU52vF/Hh0ZBIxzzkJo7wQ0+nsqlRIys6cSNXqrKqMFuvK0Z
         ulXjSp7/hNXZtUHgHzYJuj04Zqa+o5ZcEO6+i45cIlhvrcEoUjutCTnaQD8BStA9DeXa
         Ql8xZ2IHjTEIJgQ2Km/bb2blXXrZr0wDEUdCCqOMdYHlNro5sge/ijyUAcXtgsWMihlR
         M7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792406996; x=1793011796;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ixXn3fJnfeIAIim1RNqARDvvRNoU3yKYgaCFheKKFyo=;
        b=z1iXGRXCZyYgcW9Md3kmLiJtdHbOC1g0UVggRLA8uESYCMjRt/HzLuox+1rn5Rhw9I
         TZUh8oYyhfKZfdaMZ3vl2rforV0PHYl+N0HcUpjZv3YVpK4VXLWH4CT8HQCWGLzeuaNB
         leznXH7Bs+E/ForYrzrPQMAR4BVkyGD1dLk3b1auA8njIJ1iFPorSiFMf2j9imd9vKCq
         clLfjVYxwAK1NqUln13HOHOFd5r1OJdG6e0p6K2Eg+4Vapih0Sh1QX24vDriA+bamFPV
         DSNvdfxlefZXBA/GxundpUJC9oRx+e827qM5f+x56AOmdvWQQlrSH1wRFthHrb1aJSO3
         0hYA==
X-Gm-Message-State: AFq9FYJhhXBavmFaF7HgAtXkZh9DHze9BQl3oubEmvJeXmyNG+U1Ab8l
	j8irfPeHpEf31eQ7DlQz4YT+OjcOKsA4xp3onI7I4AI+tKdhmCZVnxsgQtLdtXNvkI4N1zcxwDw
	lVFZb0UP3FUkYY+SNG4KppFu1iHXNdLf2Yh6GvIhSAd5DPDGuvFkqjMvmyUlcCHFm
X-Gm-Gg: AYBFou2JPArb69GG9LrNN1rKT/PQQQfhy2gexePdneLEmTCdH9cIl7fqWmEq8mi7Q3X
	zHTNUchitE+7V7itgBB2jra44g1ZchseAZn8p0pJb/oich1Dj1OdV+A/Vd+KrA3+6A4dE3E2ioV
	sPkBnS2/Rak1ddOB1xZ4D0XblFiUph5SGu+QcXEYNzUh4VnNmcYEXCPq5RsFfaeDNNbgllNN9I1
	iE1p+/84qKhp72biPxbKoQcUfRXpCneh6ClCSZPHtSOBCPtjDblQfOkv726cRgyL3exgQJKJ3Db
	Y9PyJTHsWBXDbKTRUTwaxMPpnbzZK9aHe1QbMHrY6dFQdxOdoRc1NGnV6VBZ3YBl4NJYarC4+eZ
	7s+REib7RtNtriI235023pIyCYzpv
X-Received: by 2002:a05:620a:4801:b0:93c:891b:90f1 with SMTP id af79cd13be357-93f17f4bd36mr1732791885a.26.1792406995603;
        Mon, 19 Oct 2026 03:49:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4801:b0:93c:891b:90f1 with SMTP id af79cd13be357-93f17f4bd36mr1732789385a.26.1792406995137;
        Mon, 19 Oct 2026 03:49:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf983b88sm263881835e9.7.2026.10.19.03.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:49:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:49:50 +0200
Subject: [PATCH] gpio: sim: constify struct configfs_attribute
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261019-gpio-sim-const-configfs-attrs-v1-1-e9f919b32f08@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAM311WoC/x3MQQqEMAxA0atI1gaajlRmriIupJPWLGylKSKId
 5+Omw9v8y9QLsIKn+6Cwoeo5NRAfQd+XVJklG8zWGMdGXpj3CWjyoY+J63/BolBcam1KDrjx8H
 yiwZy0B574SDn85/m+/4BLJ0MSm8AAAA=
X-Change-ID: 20261019-gpio-sim-const-configfs-attrs-60c742e31416
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4128;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OpIfYGjwvWanOMzKl0IJaDsblD+LeWcNFqt3SwKwRnI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq1fXRt4zy3aRAdB0Xz4YLRxH/IvaQBWnDoth26
 LDuYhUkEiWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatX10QAKCRAFnS7L/zaE
 w6RzD/9TiI8t+lKUmAk6ddrNsEtGBb15kRDFF8VCRzzXPny+C6yvcR2etmbhp3eD38SeesTYfAU
 8S3aqieKWjlaQdWdbco+041MV9qN3a7/c8Tq0hOMy9bbT0NskgnETklAiT2+rd1QBEFk/MlgoAE
 4Jwjd8MFIzLPpTqmH2BwkgP0om5zaeQBbnvpVhoawosWm0vvu6qYW2kjnWx0PkukXTL073EapNx
 OFm6qzbH1DLch8OhYYii3Dw2DYFNkizhyiWm9VFZ3zcLJyupKolvdTZelx6CNTJRxxohy8Hb57+
 rlszD4kHDgB4quaGr/mEr/ZN7GIfk4a/HLDFnp9mxvA99R2T8LhtBoalVedweR3jkWfOo4AjTTW
 QnIHWDqV2Uqy9QAGUuTYLF65M/fffBebeg2+wDnz6sqjlxziGN9EMVsp1u26G7e4AtapE6YWHue
 PfZcuAuaMRxRz2JIWYm1Ww3B19wcEy42JyGN0VDH6ywve28RwwL4ZOGzecuoy5gFpXysTdNgLuN
 XEs/ZX7PF57AB0pty3FDW8gK1x/PZ2mue1lGj+U0ha96yP5Bq2oawOpo55Gf8YJEDAYusygGMLV
 dRuCt7gNx4oaxZjs2GnTdF7UaTAoonUWp3ldHPcVS8sp7io+Kdstd53Ube8oE9+GkIUjxWsH9MG
 1TJPoeHY2LmmI/Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MiBTYWx0ZWRfXwbIgYAQupSSv
 wC7wjPYQ8/ugYWKHxqkA2T+Ius234Al8Zvi2HLy8IaIohZm34/t/lFz1BKGotOdBcJNsosIhnHV
 2UtUm+KJhUw1gIhOzmIRVH4pEwXZmjA=
X-Proofpoint-ORIG-GUID: TGt1yEahnjv-Up9OzHFgsFuntSHsYnLD
X-Proofpoint-GUID: TGt1yEahnjv-Up9OzHFgsFuntSHsYnLD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MiBTYWx0ZWRfXzWUpjdDUNzXy
 o5ofXo3TjaHSW1ZEHhC/SUiM+QC/DLo3s2YF/BXtEfADLry+hyxi0hcgZt1NGQYU+RIUZ/7RkrZ
 2YGyjI2Xyp9MFcf+gpB/p88iNvi0bylxg25m2WbZa3qQbR1s3d2rvgj7lPcflaWk1WcPzfn+nu1
 GF14j2ATBIypGRtEgMcNQv8ovznucJJaAvXvgbyGHTRnXwVWcVfIvQIl/bGYrG/E01t1bRdQqTm
 D7aKrW8YOgaIzBJsjGimPUIpwxLWGLf0JJdh6QlAcwOX01/jgtjmHaaemWaAf90rOFDN70Qtarn
 bG+MwqyqAE6wrrXfUSmxdRm3q73Gvu2JCdMQKR8hFiMS1IHc+fkOdC4YSP/ahi0o0cxgp++0ZCH
 ib3dZYFzFqdbBvVKwVq2n1bim2JVB3UAQjmnhnbEyeuqF3C0BhJ2FQVMhBBU+cvjGN/b/G5+QHV
 LAZ7wTTNQ5EEQOU2hbw==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad5f5d4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Wq-taQcThYqdmZ0x84UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190042

In preparation for the constification of configfs attributes, make the
existing instances of struct configfs_attribute in gpio-sim const and
use the new st_attrs_const field of struct config_item_type.

Suggested-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Closes: https://lore.kernel.org/all/20261016105712-707634de-c955-4c66-957a-2bdb84bca3e4@linutronix.de/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-sim.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 0c73bec042670fc5706b4a93700e652cbaf3605e..acfe56af515dfd494f1f08bef5806524a6ef7f01 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -1037,7 +1037,7 @@ gpio_sim_device_config_live_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_sim_device_config_, live);
 
-static struct configfs_attribute *gpio_sim_device_config_attrs[] = {
+static const struct configfs_attribute *gpio_sim_device_config_attrs[] = {
 	&gpio_sim_device_config_attr_dev_name,
 	&gpio_sim_device_config_attr_live,
 	NULL
@@ -1154,7 +1154,7 @@ gpio_sim_bank_config_num_lines_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_sim_bank_config_, num_lines);
 
-static struct configfs_attribute *gpio_sim_bank_config_attrs[] = {
+static const struct configfs_attribute *gpio_sim_bank_config_attrs[] = {
 	&gpio_sim_bank_config_attr_chip_name,
 	&gpio_sim_bank_config_attr_label,
 	&gpio_sim_bank_config_attr_num_lines,
@@ -1228,7 +1228,7 @@ static ssize_t gpio_sim_line_config_valid_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_sim_line_config_, valid);
 
-static struct configfs_attribute *gpio_sim_line_config_attrs[] = {
+static const struct configfs_attribute *gpio_sim_line_config_attrs[] = {
 	&gpio_sim_line_config_attr_name,
 	&gpio_sim_line_config_attr_valid,
 	NULL
@@ -1364,7 +1364,7 @@ gpio_sim_hog_config_active_low_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_sim_hog_config_, active_low);
 
-static struct configfs_attribute *gpio_sim_hog_config_attrs[] = {
+static const struct configfs_attribute *gpio_sim_hog_config_attrs[] = {
 	&gpio_sim_hog_config_attr_name,
 	&gpio_sim_hog_config_attr_direction,
 	&gpio_sim_hog_config_attr_active_low,
@@ -1390,7 +1390,7 @@ static const struct configfs_item_operations gpio_sim_hog_config_item_ops = {
 
 static const struct config_item_type gpio_sim_hog_config_type = {
 	.ct_item_ops	= &gpio_sim_hog_config_item_ops,
-	.ct_attrs	= gpio_sim_hog_config_attrs,
+	.ct_attrs_const	= gpio_sim_hog_config_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -1444,7 +1444,7 @@ static const struct configfs_group_operations gpio_sim_line_config_group_ops = {
 static const struct config_item_type gpio_sim_line_config_type = {
 	.ct_item_ops	= &gpio_sim_line_config_item_ops,
 	.ct_group_ops	= &gpio_sim_line_config_group_ops,
-	.ct_attrs	= gpio_sim_line_config_attrs,
+	.ct_attrs_const	= gpio_sim_line_config_attrs,
 	.ct_owner       = THIS_MODULE,
 };
 
@@ -1505,7 +1505,7 @@ static const struct configfs_group_operations gpio_sim_bank_config_group_ops = {
 static const struct config_item_type gpio_sim_bank_config_group_type = {
 	.ct_item_ops	= &gpio_sim_bank_config_item_ops,
 	.ct_group_ops	= &gpio_sim_bank_config_group_ops,
-	.ct_attrs	= gpio_sim_bank_config_attrs,
+	.ct_attrs_const	= gpio_sim_bank_config_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -1560,7 +1560,7 @@ static const struct configfs_group_operations gpio_sim_device_config_group_ops =
 static const struct config_item_type gpio_sim_device_config_group_type = {
 	.ct_item_ops	= &gpio_sim_device_config_item_ops,
 	.ct_group_ops	= &gpio_sim_device_config_group_ops,
-	.ct_attrs	= gpio_sim_device_config_attrs,
+	.ct_attrs_const	= gpio_sim_device_config_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 

---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261019-gpio-sim-const-configfs-attrs-60c742e31416

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

