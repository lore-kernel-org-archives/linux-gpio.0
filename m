Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795862598;
	b=bXKotbbGjxaUae2VRKscbrh7gWnYCDulr+du+VoqYjikNwqldvOshPBxBCIM436QkwR3
	 Rzj4hTsqfW/apXchk91l3BRojg/mECM4vOkHEBmqtLMr57EX1EtKvZ1tLFQH5+Ezf0f8s
	 e9czsXpJoaTz32O/7ewcI00qhhsnjEscP/2I7oluKpH1vswn5Eii9LyL02j2cN9AqQbkN
	 Dz4vKvmJcH2OtjxNRjm1aJ8Rn7Ihp+2IfdbmYZaW9LPcnVygNji7lS9E3blaX8h26mUes
	 hOZhJwOzbQ6BXEAZcvNzdLB7m74vOLgFaL9WXRfg8ZiDBW7fiYllaAWfvDQiMtq/n0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795862598;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=C/lDYdob55bvE2W1KWRZ+VQ0Cq5U4MER2MlFG2+HZaU=;
	b=2q45OfJ6mNXXM4QbHc10eGzKVrxYhjO4YZDLijcf3zWItwLu2xqxcPO7sDWKECbjVi0h
	 MVusOBZON3/3JIw3VHKzHN2MWP01CLJMuXSeDqZvtrc6PgY1HwKMWvdMdyxSk8iXm/W+u
	 kYwkyivh0TgnakMItPNFMrM4SD8y+H69md+ENeapWdTYeo8ZCQ3Y+p8AHqC7HdRcJjDw0
	 r/V7hUKOIIuxKjUHWHx1XE+6RErWzmlJaQ+owlysauqVn4EErMgWBrFfOYTzJ3gXI2V9N
	 JaiZ932ZTZ+4FB78tO4D5uN/yCCHTEyigzLFWsv49A420Nfv7/NozPgZpYf079iOzqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oCwQvpO+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D540606A323;
	Sat, 28 Nov 2026 10:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oCwQvpO+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795862597;
	b=XS8VZ6d+g8GdFl79IzXH/eaa20LDsNfrxpAKtHp2sH6+82uNtI8uWHzONaKju0UIca2r
	 DVzszJjvQIZxeEw7S/kYMEGEn9JpBGBhPRdchnHen20PLtoJQGb/ZUqFGfCC04ubqIow6
	 h6vnSJ9dan7U+FPn2RfduT3zUhNEocMrqp+tbXYSzqaA+wQzGS//RjSvfrjCMwLUi1FlQ
	 dbmM9Pckv/G1DOqJxRmSnPuUHigNsn/VvDsU9uy99kczZJ3BMBTATPvrKsAzJoloqpPkT
	 hI01yAOuPh42KNBsEVLfc3krCId53UPC6E+apG0Z4xYH8N+IyrK+2PlZIe/0GnWWv/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795862597;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=C/lDYdob55bvE2W1KWRZ+VQ0Cq5U4MER2MlFG2+HZaU=;
	b=wgBueiGtEiwxL8OkrKU1gAcF0e6ImT4UiF1w2zw9kR6u2J6kKd9LXqZZckuEYDV7IQXZ
	 exgtBFMQpPS/U0ZLEDNL12ksMTt7Hf27E87nvYEgxaphJOx3ApHNbpgZbbTNqEYaARVCU
	 WVsJA1ieg4KqDr+uDHMi9dRXMurEvjX1f+VDMjWam/XxbBZpa3SCaSCbYSC8Vdlk0SmqD
	 LPYK8zOpzucJTHj/R1jI9XazmIDddZ5LQMnm83RLSh/SSinbOctYoUm8EwOEtIcAyvwex
	 iugTxcA7vBq5x0BO0UZO43Lhdw8qZ5I/XZIZ74G/QW3ZQ5W/T90s89jGnjUyEepj1pg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 505351F00893;
	Sat, 28 Nov 2026 10:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795862597;
	bh=C/lDYdob55bvE2W1KWRZ+VQ0Cq5U4MER2MlFG2+HZaU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oCwQvpO+R0Ox4yDvstczvmJ7fEF/jSwmyA+UkzcPak1LwtGJSDTCxqBLypfRXj/vV
	 SmvE5XnLDf/XfNg1vWr+M0xQrzHprMbyD4DU+7a5P+knSThTd9E2gAUi6HbRIs7ew5
	 HvexWF+zvCYivoA+09jKVhtNF1r9yOVfGSHLskYKPnL29FsELQax4kR/USSb9Ot67i
	 2wym6JBisDZgahtTxyTHKJRBMEKJ1MMolbVueTqSty6Ha731Bk7u1olASARFt4I9fv
	 cwXCB+LymP8bOlE06/K3Jqz0Lgi8KR2W6xOW0pArbreLdFrFGIIXdim8FwBsPnT3Q/
	 iv7hW/Q4Y8Hdg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D5F754E065;
	Sat, 28 Nov 2026 10:43:13 +0000 (UTC)
From: Fabio Forni via B4 Relay <devnull+development.redaril.me@kernel.org>
Date: Sat, 28 Nov 2026 11:43:10 +0100
Subject: [PATCH v5 1/3] mux: Avoid use-after-free of args.np in mux_get()
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
Message-Id: <20261128-mux_fwnode-v5-1-6689b52f3800@redaril.me>
References: <20261128-mux_fwnode-v5-0-6689b52f3800@redaril.me>
In-Reply-To: <20261128-mux_fwnode-v5-0-6689b52f3800@redaril.me>
To: Peter Rosin <peda@lysator.liu.se>, Linus Walleij <linusw@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jonathan Cameron <jic23@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 xu.yang_2@nxp.com, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Fabio Forni <development@redaril.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2845;
 i=development@redaril.me; h=from:subject:message-id;
 bh=mSUN2XB7AO+i+Tb9poHmPGuTkK3zEgmaJX/InXRWrf0=;
 b=owGbwMvMwCXWeKho1tqFWemMp9WSGLK5Njg8PJej87AkzO15y+mIWVcnbzOZeqZfNqX0yoqQI
 hPrFpFzHaUsDGJcDLJiiiz/nYw2dZuZGN3ql6iFmcPKBDKEgYtTACay6Aojw2ye1Zv5TZkvvIuY
 8Np+h3C5V2luy7Gf2486vLsjzarLwsTI8MT9wsc9f2b27I7Itrk6oYVFcPGnhN2vbzwOrDHp3p6
 7mRcA
X-Developer-Key: i=development@redaril.me; a=openpgp;
 fpr=FF4232B28B363432DA8F187D81C2729AADA16A67
X-Endpoint-Received: by B4 Relay for development@redaril.me/default with
 auth_id=1033
X-Original-From: Fabio Forni <development@redaril.me>
Reply-To: development@redaril.me
Content-Transfer-Encoding: 8bit

From: Fabio Forni <development@redaril.me>

of_node_put(args.np) was called right after
of_find_mux_chip_by_node(), but it was too early because the error
handling code below would pass args.np to dev_err().
Let's move all freeing functions to the bottom of mux_get() to avoid
use-after-free bugs.

Signed-off-by: Fabio Forni <development@redaril.me>
Suggested-by: Alvin Šipraga <alvin.sipraga@analog.com>
Fixes: a3b02a9c6591 ("mux: minimal mux subsystem")
---
 drivers/mux/core.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index 5083e3d19606..6ca40d73ea0e 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -535,6 +535,9 @@ static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
  * @optional: Whether to return NULL and silence errors when mux doesn't exist.
  * @node: the device nodes, use dev->of_node if it is NULL.
  *
+ * When a mux-control is found, it is the caller's responsibility to call
+ * mux_control_put() on it when it is no longer needed.
+ *
  * Return: Pointer to the mux-control on success, an ERR_PTR with a negative
  * errno on error, or NULL if optional is true and mux doesn't exist.
  */
@@ -584,9 +587,10 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 	}
 
 	mux_chip = of_find_mux_chip_by_node(args.np);
-	of_node_put(args.np);
-	if (!mux_chip)
-		return ERR_PTR(-EPROBE_DEFER);
+	if (!mux_chip) {
+		ret = -EPROBE_DEFER;
+		goto end;
+	}
 
 	controller = 0;
 	if (state) {
@@ -594,8 +598,8 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 		    (args.args_count < 2 && mux_chip->controllers > 1)) {
 			dev_err(dev, "%pOF: wrong #mux-state-cells for %pOF\n",
 				np, args.np);
-			put_device(&mux_chip->dev);
-			return ERR_PTR(-EINVAL);
+			ret = -EINVAL;
+			goto end;
 		}
 
 		if (args.args_count == 2) {
@@ -610,8 +614,8 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 		    (!args.args_count && mux_chip->controllers > 1)) {
 			dev_err(dev, "%pOF: wrong #mux-control-cells for %pOF\n",
 				np, args.np);
-			put_device(&mux_chip->dev);
-			return ERR_PTR(-EINVAL);
+			ret = -EINVAL;
+			goto end;
 		}
 
 		if (args.args_count)
@@ -621,8 +625,16 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 	if (controller >= mux_chip->controllers) {
 		dev_err(dev, "%pOF: bad mux controller %u specified in %pOF\n",
 			np, controller, args.np);
-		put_device(&mux_chip->dev);
-		return ERR_PTR(-EINVAL);
+		ret = -EINVAL;
+		goto end;
+	}
+
+end:
+	of_node_put(args.np);
+	if (ret < 0) {
+		if (mux_chip)
+			put_device(&mux_chip->dev);
+		return ERR_PTR(ret);
 	}
 
 	return &mux_chip->mux[controller];

-- 
2.56.1


