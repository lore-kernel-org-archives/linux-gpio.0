Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CC94D956F
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406761; cv=none; b=hbb9B2uvfRwVLMYyqnRkPp/w7P+t8lty8+9PP9ul2XLmSKYlTOutha1tIG3+bRtz2kdTu3ukvf+sXMmuN9f242L2bxFQX579SB6wl+U3G7WXmqH/Yx/WJUdVR/1CAjhaYZWFsWRL+2FdT/Mi9fhCnCb6j8UvCq24DdC8b6VHES8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406761; c=relaxed/simple;
	bh=noRTrz2VdYh31PWspiEDsw+AyR+TLV37K70/8LV7O2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iEr7O9bqe71S2PfoerW6Z/a+xX00JHzD08UpqddzpNaCeW86Qw/SRqhAS8qwbSXB21c8YAewdao6Ktj7dBBUTIC57dhQDcHxnqbsZwKIdXgXrr1A6nkv1U1yNvXO2NDbmTSYQSOJqahQr4EXXqcDjW3NqLrOEtekUmORlNjUp34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dD+1Qta6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jbbGJwN3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dD+1Qta6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jbbGJwN3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P5Yp1896526
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 10:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SlYpbb4mlzv7hsIbGJHKCC
	M/2c2MwZV2AAGrBURVcxw=; b=dD+1Qta62Jpntd+oZhBofjmDwmX14g0JSCFDcj
	j5WLgV2JVujB5DKdWx04BW1KYEvk0gu0HaYiN6O8RLAbyvXLnHHAPqMc995Ib0Qe
	sY9yMldBU5O2NLUkx7S8zs603XWtC8dZ490jCiblUGmz+WdfYerXz7OUmR69zRxy
	R8xXG6UmJ1vYN2xNDyB/T4hhSuDM+sye1vWzf0Lu4LPaHd5gFQDcHIVFVzumhP48
	l/pAxtfj4JmptNOXSGRXMDHDdbvgf1Y0+nN4h2cUKTAUIh9zlPeHAkdpmMOadC3d
	CgEBcD6dJ7Pzsb5XVNO6aLTZRHW2QNS9CS+hj1veK3jKdhaw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr9fqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 10:45:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so452195585a.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 03:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792406756; x=1793011556; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SlYpbb4mlzv7hsIbGJHKCCM/2c2MwZV2AAGrBURVcxw=;
        b=jbbGJwN30QwMy8WYQurR3gQj9xtvPu4ITrsxsdQRlLoO9j3h+SJ5tjVRMenwZNQ/sm
         Md308pT0nJtIEY20jAjeeMmLPsrjK1kw89CuFzdxPuz5D5lngP+VHCZb2EwAhNxj1wFd
         +ODbSMvxpop7KFUIxYaJ5fC5vGIVkqVZY1jaGtGe9TWdnlig4oGasrzDfUtg2dhuQtqt
         e3Tny8+46ItgJ0WKcuswFTmx+GIwJe85iA9zsPWVx6zzhIgsoQ8UzubBH/1lPbwmpVi1
         UsmjwpZtFKZ87VK/gAAqBjLl23PQ1DybJL+kWUPXJWJEUDPDMY0WLPI7fH1tP1XWsjeY
         7snQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792406756; x=1793011556;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SlYpbb4mlzv7hsIbGJHKCCM/2c2MwZV2AAGrBURVcxw=;
        b=BxB1elRHqwZCsqTpUq7Z5kIUA7c2ZmpOq9vE7eDIT5XenHrJ2t685lghlgpNPWCtTE
         nHxmQGd1jJ4QHTdciKgBZQoQLUIkBEB7Ke0ZX2E44QDwO66h7NskRfiI4iZ10RqXlhOm
         DXGfk90B+jtX9OpkUZwOaxKfK926MNOVKoStojRw5gbBo2LPeSHhb+aDy8h8gxiFMh5u
         YwG30wJvUGk5sRvAS1R/1VudGCcuT+wkM9GdTEOs6J1xcinvfTSxambqbV99nNSLmN1s
         u7wJGB9F9+r46G3K86NhcQ04zpe4IYcK00GFCnGNfTF15nOIOFJ4Kt2q0w8q77wmivJO
         aZxQ==
X-Gm-Message-State: AFq9FYJAzR82RpsROI4p/2LpzQ4xTrMBmqhu/zpMK4Jxm6Ibr6HOMjI3
	jL1q2of794jvqfUqIySm//6lixR83CDUd/G9vDuavvqoMx7KXYrr/FFZNFh1ssa6pJuTm+mfQQo
	ZZgJmu9XucOnjYuO+nSvjAGaPBEg4MH4SD5ZberrH0mMXBEO+Q/5W+7F4w5EJ1yQT
X-Gm-Gg: AYBFou1bP4in5RqudDmeArM51snfG5H2e9jqpaJSf7Kn6nzJuLUosjtoCpwvJopwkFV
	RwDjLDf1EEO5L4FVszj6FmnlWbP1yDJapIfBgAPJKfeld4fpdyCX7Bt1M6RVIJPdngnMx5mwzxy
	lBpp2cB+tA8vY4PV8ogTMBOnY9mkUzHDNutMVpVBe1O6Qrbk15/L/Rkq3L8N7ikCpF7CaDJjQ0B
	3K43oFHUwxe0mTiOuMIfpIKpKJFT8QOlg0wW2OjjAX/a0Rv5sulTi/dJ/jfNm56mcNZuWnsUBW3
	1AtDhSpIPl8cDfc+/OfrycqYfQDdSIPczBgxeYbfLj9ZApTGzce6n+xs2mcr1vsUrApoc7/DVPK
	Qw72Eb+U1o+dLHqsQBH4bcvGRo+BI
X-Received: by 2002:a05:620a:690d:b0:93f:3a43:2771 with SMTP id af79cd13be357-93f3a432b60mr550349285a.78.1792406756022;
        Mon, 19 Oct 2026 03:45:56 -0700 (PDT)
X-Received: by 2002:a05:620a:690d:b0:93f:3a43:2771 with SMTP id af79cd13be357-93f3a432b60mr550345885a.78.1792406755515;
        Mon, 19 Oct 2026 03:45:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd47104csm24949726f8f.8.2026.10.19.03.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:45:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:45:48 +0200
Subject: [PATCH v2] gpio: sim: access sysfs attributes as const
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261019-gpio-sim-const-sysfs-attr-v2-1-9ae103b8a680@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANv01WoC/42NQQqDMBBFryKz7sgkYrRd9R7FhcSoA9XYTCoV8
 e5NPUE3H96H//4O4gI7gVu2Q3ArC/s5gb5kYMd2Hhxylxg0aaNIGRwW9ig8ofWzRJRNesE2xoB
 FSRUZa6uSCNJ+Ca7nz+l+NIlHlujDdl6t6tf+Y10VKiw73deFrq/UmbsXyV/v9mn9NOUpoDmO4
 wummpznyQAAAA==
X-Change-ID: 20261016-gpio-sim-const-sysfs-attr-350706cc7500
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4691;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=noRTrz2VdYh31PWspiEDsw+AyR+TLV37K70/8LV7O2A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq1fTegQaYzqDyEr0bDekuQXDb0GU57XiIMmEhd
 fjTEle8zneJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatX03gAKCRAFnS7L/zaE
 wytBEACEsQscYGxRh9jaLd/rGzX8EM1vINdRwkB/LQJtQX/KtiKTkwFY+7iYC67J/Ypu8uhEus1
 jIeIE7mvyWoH2BfdFuwggslYxzZzWvzODCPW8TrB6ffqZuuyPyPyx8a8RF8GexHE08iuXRoZYAD
 3G9gud5ccQ8fdwW7bvRHJyVSlMI7KGRRdshsqg11VBNkyURZIQer6CuEFYN12pjcJUn7yYgkUW5
 5+xTCTFeqYbo+ZcyZWTZLv1TSKgw7HI1wbp3tg/2+GJoLArrBvCN62tA5oz393JlPhaUTqGknMY
 l8yNvx+znf84WCtGe6iyObPpW6QGcEC7ziXBMpp47FBNpq3K3rDMer7cJCN4B7G6sNZCkY1t0BQ
 uCR38nmdrEU41uOoEyEcDu4nkVgiSK6vgy7G8k3rWZJfypPfpupDF6bGiXiGggcJwe7soWbJ4Qy
 ohmQVEqS3zD7oC/7O6JGE48rTb460jNbTiPTwIU8h7lNkmobBNSRAiHVdWtROaxUwch4uDRrehI
 B/BAL5Wpsbm+42ToHo0PrOPz/RaCI4HZ1HYJZKj3+FCaWmaSOXiPXGpAfHMkMTl/Tfjpw5emTqi
 cwO4veJeuKaMsOJ/iFIs2pKfBZZxAtdl2pX55rKcrDI3OUP+RSYDAnkmAkTg7mVRoaZ4QQEUIS1
 Ciycf2Z+4jyXnvA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MiBTYWx0ZWRfX8Y3xK75+Z7aD
 7fd/Ct1TTkwoUvbSdDZvn3XE2tU7acmGS82NFSQBNU78VoVD126RAUMpX7Ojy3CcVmsCkHuvwnI
 7cLp627mv2T6nO+6Hg449HdQqErPB0EzG5FVg9Xt6zr4Dui12xu/BgLheWarvx6qjR6cf0LH2LB
 ZF4S/NMdCLJzaarHSxAbTAJr8HKbysRK/ws3zsJFv6K52hua1M+hWcboZURlv9m0mwiPbN38eAE
 pTphXK47AuTlKpwQtQFUG6vp/l2pIsJwJCsQ5gjClB+reMGOfUtlTX1ZXqhEhn817bM2elQWLGL
 rjn6oogVraDnGOgRtBOYvkSL1LlpL/N4EfYVBQm8b1V6MizT1mULM9cpIDUOz7PkC1/xUnWkKSs
 4GvgiHqzRWjf8Y+5jEu5UsFzkXvq+tSlgHxhjjti9TKcHfCW4Eie7wiSBvklPX47JiJGAKmK2c5
 Cnx4fqVGYmhqWlhVu9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MiBTYWx0ZWRfX7zcJl40Gnl5u
 kj9jO6OOMZRRb1wkM/AM4GMznM5bo8EMRu502KKy9SrGEV0HoEQlYd0nJk59CUjIW4un/i8QGCL
 yot3AVxDcKEwx+coqJfmOEOmgkBsvbs=
X-Proofpoint-GUID: 2x_xBsZSS8LRJFNO0QfvPkUc-vv4Iajp
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad5f4e4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=-3MbpOeJX28-tSa4Ch4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 2x_xBsZSS8LRJFNO0QfvPkUc-vv4Iajp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190042

Use the const variant of constainer_of() to access struct
gpio_sim_attribute which wraps the dynamically allocated sysfs
attributes for value and pull of simulated GPIO lines in line with the
currently preferred approach.

Co-developed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Thomas: thanks for the hints! The code you posted compiled fine so I
included it in v2 and gave you credit in the footer.
---
Changes in v2:
- Complete the conversion to const sysfs attributes as suggested by
  Thomas
- Link to v1: https://patch.msgid.link/20261016-gpio-sim-const-sysfs-attr-v1-1-5d2f832890d6@oss.qualcomm.com
---
 drivers/gpio/gpio-sim.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 0c73bec042670fc5706b4a93700e652cbaf3605e..34b45d0d357505d7d7ef248560112d3106c50000 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -59,10 +59,10 @@ struct gpio_sim_attribute {
 	unsigned int offset;
 };
 
-static struct gpio_sim_attribute *
-to_gpio_sim_attr(struct device_attribute *dev_attr)
+static const struct gpio_sim_attribute *
+to_gpio_sim_attr(const struct device_attribute *dev_attr)
 {
-	return container_of(dev_attr, struct gpio_sim_attribute, dev_attr);
+	return container_of_const(dev_attr, struct gpio_sim_attribute, dev_attr);
 }
 
 static int gpio_sim_apply_pull(struct gpio_sim_chip *chip,
@@ -270,9 +270,9 @@ static void gpio_sim_dbg_show(struct seq_file *seq, struct gpio_chip *gc)
 }
 
 static ssize_t gpio_sim_sysfs_val_show(struct device *dev,
-				       struct device_attribute *attr, char *buf)
+				       const struct device_attribute *attr, char *buf)
 {
-	struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
+	const struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
 	struct gpio_sim_chip *chip = dev_get_drvdata(dev);
 	int val;
 
@@ -283,7 +283,7 @@ static ssize_t gpio_sim_sysfs_val_show(struct device *dev,
 }
 
 static ssize_t gpio_sim_sysfs_val_store(struct device *dev,
-					struct device_attribute *attr,
+					const struct device_attribute *attr,
 					const char *buf, size_t count)
 {
 	/*
@@ -299,10 +299,10 @@ static const char *const gpio_sim_sysfs_pull_strings[] = {
 };
 
 static ssize_t gpio_sim_sysfs_pull_show(struct device *dev,
-					struct device_attribute *attr,
+					const struct device_attribute *attr,
 					char *buf)
 {
-	struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
+	const struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
 	struct gpio_sim_chip *chip = dev_get_drvdata(dev);
 	int pull;
 
@@ -313,10 +313,10 @@ static ssize_t gpio_sim_sysfs_pull_show(struct device *dev,
 }
 
 static ssize_t gpio_sim_sysfs_pull_store(struct device *dev,
-					 struct device_attribute *attr,
+					 const struct device_attribute *attr,
 					 const char *buf, size_t len)
 {
-	struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
+	const struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
 	struct gpio_sim_chip *chip = dev_get_drvdata(dev);
 	int ret, pull;
 
@@ -361,7 +361,7 @@ static int gpio_sim_setup_sysfs(struct gpio_sim_chip *chip)
 	unsigned int num_lines = chip->gc.ngpio;
 	struct device *dev = chip->gc.parent;
 	struct attribute_group *attr_group;
-	struct attribute **attrs;
+	const struct attribute **attrs;
 	int i, ret;
 
 	chip->attr_groups = devm_kcalloc(dev, sizeof(*chip->attr_groups),
@@ -396,15 +396,15 @@ static int gpio_sim_setup_sysfs(struct gpio_sim_chip *chip)
 
 		val_dev_attr->attr.mode = pull_dev_attr->attr.mode = 0644;
 
-		val_dev_attr->show = gpio_sim_sysfs_val_show;
-		val_dev_attr->store = gpio_sim_sysfs_val_store;
-		pull_dev_attr->show = gpio_sim_sysfs_pull_show;
-		pull_dev_attr->store = gpio_sim_sysfs_pull_store;
+		val_dev_attr->show_const = gpio_sim_sysfs_val_show;
+		val_dev_attr->store_const = gpio_sim_sysfs_val_store;
+		pull_dev_attr->show_const = gpio_sim_sysfs_pull_show;
+		pull_dev_attr->store_const = gpio_sim_sysfs_pull_store;
 
 		attrs[0] = &val_dev_attr->attr;
 		attrs[1] = &pull_dev_attr->attr;
 
-		attr_group->attrs = attrs;
+		attr_group->attrs_const = attrs;
 		chip->attr_groups[i] = attr_group;
 	}
 

---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261016-gpio-sim-const-sysfs-attr-350706cc7500

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

