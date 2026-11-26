Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795700486;
	b=elN3soONRpJDj6FXVauqd2cbs6RRv/ivLPWQuNDaDxEuZZk26OpxKAX9pQNwttOpFZiJ
	 kp3EOm2VQ0ZLqwSwaEMrLg9T72HS4EBGOyR/ie25UPXTkurSXKdHJwkCgszDtody1YFu1
	 q07itnK49FmuvQVvf3Qc0EQEShEvAo5w3fJktTzI7lkndlv50QAc31yTNQvJI2uGflQZj
	 DN5PoKqH8e9iXmJ59dvPaVyZcs4Y2Hqaydg0E4zmXBATYeS0rtV0TcJOJLFS4Z1q6d0vc
	 y8TOKxxN8BjAnLzqZvoVwdFqIyrjDvMXIzCq/ymrsn9UkAi6qySZGXTz45MdQOhrnBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700486;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wpbbKA4ajLzIsgcmiI1L7FK42JRHT9STO33kEE3TcR8=;
	b=M0sZC0mD5IUUX8uFOZieJCk1hxgU2Cx+sWC2jzJocqoECCZKXu6aVRyIS1TqmEPXAO9l
	 bwElFCVwjWqmwW06U/RGk8SRwjjEWT/a60NbwfPuGZLfMhaWqY53hEyzhU28GTvL+4mTD
	 H98Xu1PTx/ei4a7BCrQYPYrqi1fMn3ZuiA/4C90IrBHlhZOJ63J481RvDt3kvb7UtEStJ
	 lWckZmb/TXC3NwxsqQtGiWEBCDE8xBf6NZndiOcrdqisp25DKmWLDz9QI3cqEUWeqxTf8
	 P+Kc5FLp55U147DjkLbDGoC6Yy6DklL7wBjUCjmMPOM2qPqaFKPXC6KYDiNtQMdkhSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrqhfQUF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67488606A31C;
	Thu, 26 Nov 2026 13:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrqhfQUF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795700485;
	b=Cjc7foOk7ewJV2BQwFgJaSb+h1AhVvKA4olQh+1wjtUj6VkccNOvzmvXywaTqoHm1jVJ
	 shToRtGD+7ePR0Xq/TBbvLddf19k6EaNjP3/ZM2NzPHgPBLegZaCrHSJPbq4WnwOnjxjB
	 7vM/aAS6sakDglQAzenyQGJSEJvv3+pBlpKvJtYTq08Ux/ChRHsWz8SVzSD15I1CxUMuB
	 Li3aZmKUbAfsCL8dHnuSNktT5Y7cqTCdCyC3zaE0i4uSpGsoQiPwm7byouCNNZc+1oZTa
	 u2eHcoBwrCWuBVKuE1OI6nthKEYJLMlq7SGF4jbu1Cp6hm8ezNiaoMz4SDDWO5axjNg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795700485;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wpbbKA4ajLzIsgcmiI1L7FK42JRHT9STO33kEE3TcR8=;
	b=qiAJWA+nUvjSZkQb7lLyFRV2bCPuuZoMiqhh3D3Ntr86xRbNdUjhBbI5DyIdifLU92Aa
	 2y7uTXDVkXsC6Jw5wbT+weTVjiMEr1OEOLqKTCV3DztZakKjLOpfThANu5DU2Sq14LaQy
	 6euv1UIEbUoVxoJoIfaC0T6DRUnujq0eFC7Pdt6JEpEf1P+3qZwbs1Yn7EnzAapL7Uo0v
	 k39LUhZ+U0barsKayELDKy3KaciTraVmpA0UYM0lNrHx4t5n4Ft0Or/o4svO6qSfhArWK
	 +89mkniAJG3HE6WOXiAJJ2qn1TFMV/Z1Ok418zkEJtOf+UmHL3FVCAQcCgX312Tq2Ww==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B9F661F000D4;
	Thu, 26 Nov 2026 13:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700485;
	bh=wpbbKA4ajLzIsgcmiI1L7FK42JRHT9STO33kEE3TcR8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TrqhfQUF8npLtO2XFNAnGoZq14Vyv8KhcZ5JXebwjx2Lh+kuq1SC0iMgAKCbeltax
	 Dl9dnapgk2iV8VKAknKhSA+H8mZB6GBYkk4OcVxsEE4IPsaUV+jE/aMhZ6SyOT0f0M
	 hAbfQ2nS5ecTRCSCViTuHtlvecK6tC+JRlt14CY6ndX337ymbArzfEg5jGF5k/V1TT
	 UsZaaS/HdJ5yO6tYoJOSz3mk6eQunK1X4ipLiyXO6lRzkh36UPxKlaipdVXoqbL5BB
	 0grArQL7fa1luWRn6beL+imoVYHdYmLcm1kNfte0VHwBYi0Eeu5nUVscQ0mcy/dRW3
	 007kL/YtHrlaw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 50ABB4D552;
	Thu, 26 Nov 2026 13:41:12 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 26 Nov 2026 21:41:10 +0800
Subject: [PATCH v2 2/4] pinctrl: sunxi: allow a per-controller IRQ register
 base
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
Message-Id: <20261126-v861-pinctrl-v2-2-b1875a6a9bb8@iscas.ac.cn>
References: <20261126-v861-pinctrl-v2-0-b1875a6a9bb8@iscas.ac.cn>
In-Reply-To: <20261126-v861-pinctrl-v2-0-b1875a6a9bb8@iscas.ac.cn>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795700469; l=1288;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=Q5nKbDPfL5bIJRudVipL8eRl+Sf6kVk4l+UGPGRoSrU=;
 b=8bZrCJohIh2gijQZl5H/Bqifftn/CgDJZCWiItvlJ6fD++qTp1yNnJuu9gKmZM4Po7X7gSChf
 QUbH1OPmz67DXaaIWmoEV2DaP86qvQgW70/yaCqb4O89WFVlcHlrMCP
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

The V861 always-on pin controller has its interrupt registers at 0x40
instead of 0x200. Let the descriptor override the base.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 7c2f29e75519..a0f5eac5c914 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -152,6 +152,11 @@ struct sunxi_pinctrl_desc {
 	unsigned			pin_base;
 	unsigned			irq_banks;
 	const unsigned int		*irq_bank_map;
+	/*
+	 * Interrupt register base, where zero selects the traditional 0x200.
+	 * Not used with the NCAT3 register layout.
+	 */
+	u32				irq_reg_base;
 	bool				irq_read_needs_mux;
 	bool				disable_strict_mode;
 	enum sunxi_desc_bias_voltage	io_bias_cfg_variant;
@@ -261,7 +266,7 @@ static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u16 bank)
 		return pctl->bank_offset + bank * pctl->bank_mem_size +
 		       A733_IRQ_REGS_OFFSET;
 
-	return IRQ_REGS_OFFSET +
+	return (pctl->desc->irq_reg_base ?: IRQ_REGS_OFFSET) +
 	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
 }
 

-- 
2.55.0


