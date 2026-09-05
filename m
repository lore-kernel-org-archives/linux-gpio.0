Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4E9330D4C;
	Sat,  5 Sep 2026 13:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615843; cv=none; b=M8S1RPqFE7IhDjBT4PQW+UXxKRkfi5j9p3ksChoxfUiMHBqJi0uMuzxkMcbFnuo9rY2Jg0BChkoM+bABTrcz7frdcKnmlO/ws7Prdviy+LxVUFqxeZLlSrD2ztqsJ+yx2ESCvOAmhKkZffP6rZZa77DB0w6mwa1VjozccGKFARk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615843; c=relaxed/simple;
	bh=ycc5GsipWVpNhZ5fE2LxnnyEHtEDd7uBGr478t5UgOE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zzhi+ImWiRBMZRDRIL/Bj6a9UAJnpUXyaS7zzEcF/QHMXe1x+4lFjs8PtiCEsY80a0oPb3OCcl7qrQ6XB8c/74cpI0zW+m4qNgmhXoZQ6msWTZschBkA/MO5PoLcadYLs3j4zQgf7VtMag9HX/4bWHHtm4ru2YwA6IkKrWSqgOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oNzUIlMs; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oNzUIlMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=UW
	u3/8Xjz6xMGSiDSxBKSj/Tl3/LVtgAjs+U+h5KuJ8=; b=oNzUIlMsPFjAut1Ge4
	2wKMwerTQJJWSl0F4cGRT7ZMsCjQSlDV2bG53b08CXAvLAa9ySdEQDBMjFSLTf6c
	l+wl0HNlboLOeuN8wRv4kgQYEO5KrsKejNBNMWYsIskkh1d94DiYgW2vBtqpaMrU
	cTeliYE8eTqxZIHpslpUP9cHE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wCXw0GOHJxqegVwAw--.55937S2;
	Sat, 05 Sep 2026 21:43:43 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: "hpp.iscas" <hppiscas@163.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH] pinctrl: qcom: ipq5210: Publish the OF module alias
Date: Sat,  5 Sep 2026 21:43:40 +0800
Message-ID: <20260905134340.67477-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:_____wCXw0GOHJxqegVwAw--.55937S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw1UAr45Xw1rZw43ArWfuFg_yoWfKFb_CF
	y8XFyUXrWUCwnxXFyS9r1avFyvyF4UZrnYgrnYqFyrZ343Zwn0grWv9rZ5Cw18Wr45JFyD
	JFy5Wr15CrW7AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRBOJ3UUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxg-rtGqcHI8wqwAA3o

The IPQ5210 TLMM platform driver can be a module and matches through=0D
ipq5210_tlmm_of_match. This table is not published for OF modalias=0D
matching.=0D
=0D
Publish the existing table, preserving arch_initcall ordering and=0D
the shared MSM pinctrl probe.=0D
=0D
Fixes: a549fe22376f ("pinctrl: qcom: Introduce IPQ5210 TLMM driver")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/pinctrl/qcom/pinctrl-ipq5210.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5210.c b/drivers/pinctrl/qcom/=
pinctrl-ipq5210.c=0D
index 827a4ad..d5b4eb3 100644=0D
--- a/drivers/pinctrl/qcom/pinctrl-ipq5210.c=0D
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5210.c=0D
@@ -867,6 +867,7 @@ static const struct of_device_id ipq5210_tlmm_of_match[=
] =3D {=0D
 	{ .compatible =3D "qcom,ipq5210-tlmm", },=0D
 	{ },=0D
 };=0D
+MODULE_DEVICE_TABLE(of, ipq5210_tlmm_of_match);=0D
 =0D
 static int ipq5210_tlmm_probe(struct platform_device *pdev)=0D
 {=0D

