Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795862605;
	b=eTfUVSfGiV3ARw6u4D9kEfW6kNsGg/zRC4XjukX/Mge39nMRoK/gnUnX72AW7T+tYszS
	 h7rPNTln2Kyn1rFzDChtWnW3E7LChafCThxkWtuFn1g4zT/Mx6EEWKv1L4PmZ4oxGj6Yn
	 pRnp2WbuXKKIe5KV4NFOd+o3gSBwDCAqfZCjLDtd16TqFcAh8m9AQyIDfJrqf6ag6lC2Z
	 p4dVWem85j5h/iUAty2g0698Z3OWvtI+CpSMKlPnMJ2SFqY6N6d9pcxnQr3a3jV8z7Yn8
	 iSOjhtjk8oWdTxa7/2UqYGvTTKivg8ryxokUxu5LQbDRUCK5ta0x73ZxTQecqoboRyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795862605;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ROqy/GBHOvvDEvTSnF7fDI3jtw1M3W2yLXOSclf1iS8=;
	b=yaysn/SHjdWg5IYQhQWld077vOwJL/1n3suYjxoDLo+rer5bn3bbv3ngzadNnLxE/JKF
	 OqOmA2wfq2FdVUPe2ajg3px3L/ULI34pyPbeJF90IMRPYmgMkUSBhRH5RWR/y+ymqqAIQ
	 JdvtAAe4j3Ab320jjpXowJoHKj+yCVx/qPwZZBiTM3eC2LlE4TEEX4pPNQi+WiaLa6+l5
	 daAn1N9kxKDw1OfK2BneOvYs6HtnxGuqJMMq5eNOXk/VPRJrjofDjKk81SILzVv0NFH8R
	 FZMsZ5k9n6ckvAF2JZPAUfQFkg7aVsiJeRWVO+5MihzQFP9Lc0iW1ZXp4AYqzoys/RQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dEx5Cleg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEAF606A323;
	Sat, 28 Nov 2026 10:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dEx5Cleg
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795862605;
	b=D9XxfRsrCXXERsrpbiwHRFj3TLlv52JIFm1CbqI3NxNiQT+OldYIzPBthfuU+Dl4RYpc
	 ugvH5LBjz0GyLsBOM7fbg+RC6e2gwB965qScB5AGXhaJA6Hza9z8YBlo8Qrka0hm0Hg3j
	 iXYPoc5aTLPJ3vobYvTtiCNRnAH5xQ+5AKcGa4XKjze6pdmtp9ODUjUIrdEF3kgQrQJV8
	 78KHCwnw6CnfugZvV2KPsXqLyB60T11WyYDIxaygYWbaWYGT9jtFY2binoDpIuL0zNz5x
	 H3pPP2YGO8eb5DZExlsf/OWyQIbhAJijMaPxwPGVaKzXv9WdkSaacuEQRofmia8UGlQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795862605;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ROqy/GBHOvvDEvTSnF7fDI3jtw1M3W2yLXOSclf1iS8=;
	b=kEtQoeD/P9EvkNtjcA4BYc3tLTmRfi/u4fHML2rlH45jyBpxvrUwkeMTHzVjKSYAv6aD
	 xKd1270+Bbas18sTq/mXlotPtouui2qljcxopM/qM2IhzwlgDUmRJl1H1ocopSJj45E+r
	 m7GK59mJC5zPqNqhe7yyypuUGKTSx2WedhnRC6DCaPjEkhYGNz+PyH9yHPhfIUswVKJ34
	 FYWnjbTT2Fr8VRcPiy6BGsJju9FbDvJVfwZjGXmlEY6P0GiJWqu8V3HpKr9ShCIFC+Foj
	 y5H+DZWFL7VgrPN5GAilh2WgMSHBHzPB03pO9qJvutQ+cOxL8bYovYmM/wV2SgKZW3w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 956251F00897;
	Sat, 28 Nov 2026 10:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795862605;
	bh=ROqy/GBHOvvDEvTSnF7fDI3jtw1M3W2yLXOSclf1iS8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dEx5Cleg4fF+xzJBpaXYuWCuQyYow4qhhCS4RjXIzgZ1VAexu77zn5y0I649RHlIX
	 3d9lz0dFgDDMhu/rt61kkSw3j5mnMkKa9kWG7WVxkGGmJFD+PHsY8TuHLjP+Ka1Ej9
	 7cV5MasbbvUeIGqMEkSV3qePUEXTIIDM7OcOZBrRj506DoA+YsvIejMn0/v8updQAI
	 FvNXYJUpr/qfvTCCv0PbNMsoz91pSEQWoWp2kCa7flsUR7TnLAEjnaS5ZO6tg57OtD
	 5zcytC/qkcJ+GV4qyas0qyNE+oZ+Jih3uhE2HSmVFuJybUsPqJWwEvjpA8VrVP58Vm
	 ecuY+zxVPAMVw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 269A44E095;
	Sat, 28 Nov 2026 10:43:14 +0000 (UTC)
From: Fabio Forni via B4 Relay <devnull+development.redaril.me@kernel.org>
Date: Sat, 28 Nov 2026 11:43:12 +0100
Subject: [PATCH v5 3/3] mux: Document mux_chip_find_by_fwnode()
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
Message-Id: <20261128-mux_fwnode-v5-3-6689b52f3800@redaril.me>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1190;
 i=development@redaril.me; h=from:subject:message-id;
 bh=WsfKOTl/y0DS2QwMlaBJvQeQ9+YnIj+MD9uZdj7LBrA=;
 b=owGbwMvMwCXWeKho1tqFWemMp9WSGLK5NjjW/dzuccDozMd+8evcHl4aLhuk1x62OsT2qWtZ3
 +W4Y14CHaUsDGJcDLJiiiz/nYw2dZuZGN3ql6iFmcPKBDKEgYtTACZS+JKR4ca2/9Jik2p26fpm
 fXG8yzX9YXZVcKqKeeKLvglXr5p+ymJk6C488S57tXHfXwauthleVUe/d0rIL5XZ0OSau++LxkZ
 DLgA=
X-Developer-Key: i=development@redaril.me; a=openpgp;
 fpr=FF4232B28B363432DA8F187D81C2729AADA16A67
X-Endpoint-Received: by B4 Relay for development@redaril.me/default with
 auth_id=1033
X-Original-From: Fabio Forni <development@redaril.me>
Reply-To: development@redaril.me
Content-Transfer-Encoding: 7bit

From: Fabio Forni <development@redaril.me>

What mux_chip_find_by_fwnode() does it pretty obvious. What's
not-so-obvious is that the reference count of mux_chip->dev must be
decreased when done working with it. This commit clarifies the
requirement.

Signed-off-by: Fabio Forni <development@redaril.me>
---
 drivers/mux/core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index d5095905b02e..6289cc98f49e 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -517,7 +517,16 @@ int mux_state_deselect(struct mux_state *mstate)
 }
 EXPORT_SYMBOL_GPL(mux_state_deselect);
 
-/* Note this function returns a reference to the mux_chip dev. */
+/**
+ * mux_chip_find_by_fwnode() - Find a mux-chip by its fwnode.
+ * @fwnode: The fwnode representing the mux-chip.
+ *
+ * When a mux-chip is found, the mux-chip increases the reference count of
+ * the underlying &struct device. The caller is responsible for calling
+ * put_device() on it.
+ *
+ * Return: Pointer to the mux-chip, or NULL if not found.
+ */
 static struct mux_chip *mux_chip_find_by_fwnode(struct fwnode_handle *fwnode)
 {
 	struct device *dev;

-- 
2.56.1


