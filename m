Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439111;
	b=Lks0rPJCunbJjziqCsTH49PV5JbAiQRHofpvPi8dUk02KSIQKIB7QthLnRWAko4w2cL8
	 HVWlZZtDguGzsI/UeB4lVT+T7LYhyZLol4xu8ZS0b5F97y+e+eiebP3KnhoMau4IT6Wz1
	 rRRQ19Lm0i49VggoMVaH1PUS0JuXf2/tWTCP747IwYMgxFJeoYd8NkHCP20zbfWgNOeDo
	 dYrP1fzVZi1J0AjFZ4JnQIM0zWjTPBmQe+hdWpcen4tSMUTD5hlnEDmbSacaSHrr/VMCC
	 ClyBKOqRKavtbr5tL+9P+biRd1zpb4+1TN9pVkrxG/fYddprTtWRI8jCkTl6UXub8tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439111;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Content-Language:From:Subject:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=Lpw2z7fipusWATrnhkQRL3T6KptpqUKbe+xtKQR04T0=;
	b=5Ax7pkYZ2L+9kImjten4IrKbe7MLGaevwbR4Q5j4NtECiY72IVAJdfP7ssmIvYh29PQg
	 +vRgQP0lXOsXfJUmt8HGVDQwdLr56c0WWlMVJNBZr3oiTgVQU9nE1g5gxxg/sVDWL52Pd
	 Vl+VzvT4mOazWtnq2Af2VhpkfJ5W1y3zMJAe6gswBqGpjMTaTspn6unMZzvCmmvlNYe1A
	 XwK9EU57Tf2S1NzhcJgabdZDBYpb5GIxWu1B5EpflXRPd1vF2ZnY7cb0JzuI02mwnantV
	 KhP3U6nj6gcDjXhNfVFVJlzzLgnQX5adH/Dr/ed190kBaRHnD7eVxq9LQbxHjA91A+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=w1hotc9H;
	arc=none smtp.remote-ip=212.227.15.3
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945F9606A31A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 13:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 945F9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=w1hotc9H
DKIM2-Signature:  i=1; m=1; t=1795439108;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnPg==;
 d=web.de;
 s=s29768273:rsa-sha256:JiOqUCmUbnbK2AdhHRcvpDXT7UDn
   7uypJO2OQpIn1LwZaYfqaNPhdMVrqqxiQQMfw5VS7B7uO04OEFwFeoPpsTaumRBdpG5u2fSSqM5
   Qny//nV0/0pzE/nuSlPcOtU3Bxqf7OG/pddut8jIlkmvfNLVo0pbaaPq+EPIzBjUyHB9lN5lBUx
   CG/UzrfYSPm+c2sa0mQAbLX7Rs+77S5acVQ7MQURZZKAB+vCE5bMDNldSTRtnMvLn0gaU6esIxZ
   wAtCjwdfHmhLqblQqa6z7AJtd2k4XqLciLcHc8BLbtUkWPYSMdHDYqo2Hws28IZ9//xa6mY9wSM
   LM5UgfkBhQaNww==;
Message-Instance:  m=1;
 h=sha256:
   ipwFO5+nZ2X+P2zB1ZZu9L5pDkievZzt1LKoM34VnTk=:
   N3+zzRp2truc8QvYBUFuaFrlXBAA0WGbEft24Inw3lE=,
  sha512:
   +AyAruR/U8SRzwLDl+Axg8Lu7M8j3iN7jJDmg7qqPsanZecyozOf7OnlzjOjzK2MZGSWPd+BGWmqaY7mVB1Lfg==:
   InhO5AtXTKHbaLWQUkAOw+z1/GyQjKTTYUwHfmaHQVv1vXyX5M8GkEDQDX0jSmQxnToTIQg5xb2X9vObiBHvww==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795439076; x=1796043876; i=markus.elfring@web.de;
	bh=Lpw2z7fipusWATrnhkQRL3T6KptpqUKbe+xtKQR04T0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Cc:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=w1hotc9HFJzKTeBWwHPXNb8zPa4y+5P+nzkeiNAVW4hb/hA7f0AWUP4LQReVhfdf
	 n+mGgPAK5/B38bXXIG1V/Kl6ijaVt2a2eQBwzVz8ISMn5TKGeJy2zJS+omTwRGzSb
	 9LGXD/w3DMBleL1tvfNt7ZcyudNtZGRNJ5hDuRPmKjwyK/mrqlCOGH2cOhx8XoLQK
	 Cn4bt2n5+Qja/Er1i43WTV+FyBRKQEBcpbcci7lL6MhxLl5UAp3MkJAXlMvkCZHvk
	 s/kAwX73fHTSBmcr0sklj0N4hY1Ne7RF5qYW1Wv6PhuK4P+HgmNiYtmFlsiVXve0j
	 Wow/h55voxnBgenZ5A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MnpL4-1yKhi541r0-00ps1G; Mon, 23
 Nov 2026 14:04:36 +0100
Message-ID: <e05bd9db-c855-4972-86bb-3b7346cdd278@web.de>
Date: Mon, 23 Nov 2026 14:04:23 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linusw@kernel.org>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] pinctrl: renesas: rzn1: Use devm_clk_get_enabled() in
 rzn1_pinctrl_probe()
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>,
 Michal Simek <michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/CNVHr0Mny5XenXRKW0FshyertYX234Kz5GCzutEKxkGh2g1vKB
 HP6v+Krzont3mLjPBXm0huHtYv4sXCLuIRYAFLkGVGEz5S+DSpPadireGoSXpIMwANZZNAm
 DwS8XAiSfHOeKArgZO2KqpdVYejNqzqURmE7JJ4n/dyMdvvUqeSMCsRGJce9gv1qgNO4SMM
 wPr2Z+kNA7gn36TzMIijQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eeKdEvd8aPo=;yIAwq/JdiFnKJcEbbHUCwHr9khy
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Nov 2026 13:56:29 +0100

* Reuse existing functionality from devm_clk_get_enabled() instead of
  keeping duplicate source code.

* Delete a clk_disable_unprepare() call on an error handling path
  and in the implementation of the function =E2=80=9Crzn1_pinctrl_remove=
=E2=80=9D.

* Omit the label =E2=80=9Cerr_clk=E2=80=9D.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/pinctrl/renesas/pinctrl-rzn1.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzn1.c b/drivers/pinctrl/rene=
sas/pinctrl-rzn1.c
index d8422d740433..a6dfcd4e31ae 100644
=2D-- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
@@ -869,12 +869,9 @@ static int rzn1_pinctrl_probe(struct platform_device =
*pdev)
 		return PTR_ERR(ipctl->lev2);
 	ipctl->lev2_protect_phys =3D (u32)res->start + 0x400;
=20
-	ipctl->clk =3D devm_clk_get(&pdev->dev, NULL);
+	ipctl->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(ipctl->clk))
 		return PTR_ERR(ipctl->clk);
-	ret =3D clk_prepare_enable(ipctl->clk);
-	if (ret)
-		return ret;
=20
 	ipctl->dev =3D &pdev->dev;
 	rzn1_pinctrl_desc.name =3D dev_name(&pdev->dev);
@@ -882,7 +879,7 @@ static int rzn1_pinctrl_probe(struct platform_device *=
pdev)
 	ret =3D rzn1_pinctrl_probe_dt(pdev, ipctl);
 	if (ret) {
 		dev_err(&pdev->dev, "fail to probe dt properties\n");
-		goto err_clk;
+		return ret;
 	}
=20
 	platform_set_drvdata(pdev, ipctl);
@@ -891,28 +888,20 @@ static int rzn1_pinctrl_probe(struct platform_device=
 *pdev)
 					     ipctl, &ipctl->pctl);
 	if (ret) {
 		dev_err(&pdev->dev, "could not register rzn1 pinctrl driver\n");
-		goto err_clk;
+		return ret;
 	}
=20
 	ret =3D pinctrl_enable(ipctl->pctl);
 	if (ret)
-		goto err_clk;
+		return ret;
=20
 	dev_info(&pdev->dev, "probed\n");
=20
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(ipctl->clk);
-
-	return ret;
 }
=20
 static void rzn1_pinctrl_remove(struct platform_device *pdev)
 {
-	struct rzn1_pinctrl *ipctl =3D platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(ipctl->clk);
 }
=20
 static const struct of_device_id rzn1_pinctrl_match[] =3D {
=2D-=20
2.56.1

