Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739469;
	b=xRs296Vn7qIySzpIaZhclbEPtcFP8pGov3WRwKu7oQTMWTPDPNoqJmnC4+nvQtrnpxCD
	 hmHtm1A8gf081F5r8Xthuh3ZUTRAg5nZ8ojyTPODrFA7NArdhrgmkIZ9QuQQvnD0qFR7w
	 6dY64fTBxvqo66NQKn15a6268tfynPYLn1zdqIY9YTYmKdHkCha3wdRJgcOEyzDXcesYp
	 SlUwrlXv0ftv/GZcuuh4Au8hiMklNMWRPGub2E/mBAa3t27fxK+RH4eQtKhcduQYLz4uy
	 QoZNTQ2LNjZgvuM8uqsOGPzhxG7c4fw602SE9dAn7ebzUV9A59e2Ztw6+igaFPNJGUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739469;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=dlyM8LZ8160Xk/WGiZ4OTZ6xlqG6xxxO9wME58yDA7Y=;
	b=R0jw8gjQN9QJDW3IxADH/SLZH/yzZJyTVhmpirN+8kvbo38+8gVCn8xEzcxe7zPQsAyl
	 WB+GPlYuwQEjeSlFYkcZW+DAI9d6HDUhirgWCgcZqK52UDQ6PUTidLzz0eLpfmD6plhKV
	 W9wHUBOeJfpa+n2AnG1+2QB6jiHTVmTYMRNblnnf9r3El7F/5MdNE8n9SuHOPAtBQhSza
	 ugU2IccVbZgM2mvf9ADtUuuGHayoDLwahlua15jTVkwzyUuyvrzBL2vEchv7KjyNXv3J1
	 xPfM6Azy7UBriGt3zR08+iW3BvEVLTv9RMJhmkdd3zWfxZVGuGhZz9004hwslIaBDCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZDYeg+VD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31B0606A31A;
	Sun, 15 Nov 2026 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZDYeg+VD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D111F000C5;
	Sun, 15 Nov 2026 10:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739469;
	bh=dlyM8LZ8160Xk/WGiZ4OTZ6xlqG6xxxO9wME58yDA7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZDYeg+VDf14irn2wv54QCZHpkOTAS7zW/xAKbxkEILd1biV7FfJVGOWGuQ5ElGz2H
	 fNA3arw5CSrWMwuBlGWzUqMnXkV5ihPbH6vc7+K6rg0dH9uW98KyfKorIowTSitaOs
	 dLzOvg8e5CB/SqYNJ+zGeEFYW6mpU+aXwi2GLVVcK0+f4GKPqFEXr7iz2jayKqWsK+
	 dI0rDCw0SX1WxR8jTsXOpic7NCmmzHJt+ffyTBul/Qb7wfqxTRO+TY+2CERSNVTQuy
	 WL2Pf11NmAiWJ4Ne7W+jt1juyzWg4Vd6njJPODP1meUKCWOozba+VQP6XD4fcBWabt
	 2V9eOroVWgKgA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 02/13] pinctrl: berlin: use u16 instead of u8 for the offset
Date: Sun, 15 Nov 2026 18:23:41 +0800
Message-ID: <20261115102401.3520-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115102401.3520-1-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The u8 may not be enough for newer Synaptics SoCs.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/pinctrl/berlin/berlin.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/berlin/berlin.h b/drivers/pinctrl/berlin/berlin.h
index 231aab61d415..7e7096842eda 100644
--- a/drivers/pinctrl/berlin/berlin.h
+++ b/drivers/pinctrl/berlin/berlin.h
@@ -17,7 +17,7 @@ struct berlin_desc_function {
 
 struct berlin_desc_group {
 	const char			*name;
-	u8				offset;
+	u16				offset;
 	u8				bit_width;
 	u8				lsb;
 	struct berlin_desc_function	*functions;
-- 
2.55.0

