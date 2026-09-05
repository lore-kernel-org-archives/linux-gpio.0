Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CAA367293;
	Sat,  5 Sep 2026 13:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615893; cv=none; b=LzmU0702oZ4W76x9PRbBRmPK7duzrhVQ0oZIoIwFeMT0ikuQ9qg59rIVTzY+IDjodr/t2RRVJhFoYkURW+Iad/MRUMYWpYmYK46vYbWK26q8XoDeUTwXuGyH4hc05yR/phZGW+XO5AjyivQx9bt1+8IwuTr3M1vayUj8iWx0ftg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615893; c=relaxed/simple;
	bh=kLlEh9s1+zls9rEHLcHti5hbU8xCeiOSD/Dut4VsaUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R6ESZeWkhfkgBNr+YLQ6ACG8rHOjkm1E0sjxdrkhLvomQnxEPZvCWMkkrRNafODzSGAGSK760GiZdWL7ryePpeEZrzRXzZ7Fpf/RFrDKoV0VCmRNkfoBXewgesjHHfJfQ2aVf5ALBJaJbQaNpk1noZvylq1BhA15nd2O1OR5L4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mIGOQmQT; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mIGOQmQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=UD
	ZuSqKd7ep1EuIdjJIZGgvEiPYZKoMthJDfuUMeNQc=; b=mIGOQmQTHMSIzTYHZI
	0QGqNlzCcNxz7bNSzZeonfUCIjLK/jUeCOmI9gnmnDa77Rk0jhqgal8wP7+xkMCb
	Gy7R36TDQ3bzxxi3HeN63O3qJK36qEIUzHR3vK1QZ7Qk+TeLD9huAbHjDV6eKyC2
	2HHFdEfbsBVJhJ7GRy0dSHJ4s=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3p8i0HJxqGy6VAw--.61702S2;
	Sat, 05 Sep 2026 21:44:21 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: James Tai <james.tai@realtek.com>
Cc: "hpp.iscas" <hppiscas@163.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tzuyi Chang <tychang@realtek.com>
Subject: [PATCH] pinctrl: realtek: rtd1619b: Publish the OF module alias
Date: Sat,  5 Sep 2026 21:44:18 +0800
Message-ID: <20260905134418.67619-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:_____wD3p8i0HJxqGy6VAw--.61702S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWUAw15AFWkJr4UKFWktFb_yoWDArX_uF
	yUtrZrXrW8GF17Zr4v9w43ZFyIya1jqr1vqFyvqF13CryxZw1jvr1kWrWxGa48GFW2kryU
	GryUXF1Syr15ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRBT5tUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7RX1vmqcHLV1ywAA3S

The RTD1619B pinctrl driver is a separate tristate object using=0D
rtd1619b_pinctrl_of_match. The generic Realtek pinctrl support does not=0D
publish an alias for this SoC module.=0D
=0D
Export the existing OF table while retaining the initialization order.=0D
=0D
Fixes: c7910f6aca56 ("pinctrl: realtek: Add pinctrl driver for RTD1619B")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/pinctrl/realtek/pinctrl-rtd1619b.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/pinctrl/realtek/pinctrl-rtd1619b.c b/drivers/pinctrl/r=
ealtek/pinctrl-rtd1619b.c=0D
index b07e50d..e03e1fb 100644=0D
--- a/drivers/pinctrl/realtek/pinctrl-rtd1619b.c=0D
+++ b/drivers/pinctrl/realtek/pinctrl-rtd1619b.c=0D
@@ -1575,6 +1575,7 @@ static const struct of_device_id rtd1619b_pinctrl_of_=
match[] =3D {=0D
 	{ .compatible =3D "realtek,rtd1619b-pinctrl", },=0D
 	{},=0D
 };=0D
+MODULE_DEVICE_TABLE(of, rtd1619b_pinctrl_of_match);=0D
 =0D
 static struct platform_driver rtd1619b_pinctrl_driver =3D {=0D
 	.driver =3D {=0D

