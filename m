Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793866640;
	b=mW+x38GIK9m6ieBLjHZhzQgeI9nHeegv3M5JJX9L6R7192+QxfoF1zGC3WVLKDn6kWuG
	 YKvfAaQgmF3O5t3Z1v/0xEfEnm6+vszsSgoxQm+gnvIw/3eqwpvErAs2t8AHQwAq7Bct4
	 fWfhx4Tx79Gmk+I5o481j/EVRABy7hkMyTIyXxlUV/RJ9CIVsYn0xa18ml2etCnWCLGJc
	 F4EU334TYymbfkv5dFQ7EyRwuc6GMvygnwaVODxQ4QPdWAy22seKqSZ+ReudrZpZLCsUF
	 prInClVkmsrYTbN21LjD54OG54XnuM/J05OPAGpN3Msw3EOfH6mRafbGGia0ll1sTSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866640;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KD4AAaRf4p3UJIXQQB6vPlBio7Rs8gGThbMv02QHs+s=;
	b=t+6WtaupV8vFBt8nVY4jOC8VFHla/VMS5Ae2zs+6MLuVmXUIjo7xNmYavYJgjiuY5P8s
	 cxLrbZNvyWSLIFtbvNJoL3Tljt2u62WVLL5nvfwTPt/CKX87nekDr2CEyzM0bVl3euC1j
	 Rfd7OPuei8bJjhjscxLgV6oc0+8K+16zjOoaHQVmUvSFPuX5CQMCvnpZJius02a/PgJpL
	 hWsFDWcEFmMltNi3GuAR+ykVqqvhtmsyNnKARIDw+IGyZaNuLDdEPXHXUwGxzwaHwt5Ys
	 9GExEKX7awT6YUxjMIxhJL2GzCEDXDsfUfit8IIZUcHhWIxfS/TeApn6sorRyKpi2Pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hbxrgyxx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50722606A328;
	Thu,  5 Nov 2026 08:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hbxrgyxx
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793866639;
	b=1Tu2+M1FpsFi59jzhUDq4o6lT9V70J4c7fh2deZ5uFOngDQpuLCBtLwfy8i732buCrIN
	 MXqq0sad5mT2dQxgq+9P0NWwqXCCEt1mg1uI2Qt77b9TkEPi3bqp6W+6Xa87lyFbhWo9w
	 tcIFnGX8/GzQqTY8a5jQoje+jKIHv9J/6kG0VEN6dg7zPzRedMY2E/6VpXVpgtxMPyqvB
	 NjDmjJPJs2632yBrGDYUykaPBCtREbXzTD55gsC0mDjKLlgNCxzWAZZvQS84lLKvie9gA
	 BUXVjiD97LjdNWDxgIb1+uS81FW72P4fewNSYh5VreVt7tmFd9bCvBsf1xr/oNeQCcQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793866639;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KD4AAaRf4p3UJIXQQB6vPlBio7Rs8gGThbMv02QHs+s=;
	b=P8dR/otbnKnoNLmKnw5R6EHiD9l6QCkSB9xxsG5eAMROSAPLIGpc7w2fry8cRw3CmC2W
	 9pXLAGnP8E8K3PvXhm4+ZxTaZBrpNzLArU8Gr112dwjgZPHMbwAn6LewBI1dslFTDemP+
	 u9C/OnW5ys2De1Rezwu9nNXifaevGsjnOQOTa8Dk5j+Ye+yxvs5F9XLy2JhieertnDKYY
	 QbcfklRbjb+mHIfSNJP/AfL5DfDELdC1i1Ab7H80Uty4NnO/QIh9RS2vK3sY+ALTiITZ5
	 7SCjDiRL6+pPOkzvcA6XZvnp3TOY+mDK5nDe6ugb29Lzo7sBqfjFstT9HEOw3KuKuMQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57B8A1F0093A;
	Thu,  5 Nov 2026 08:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793866639;
	bh=KD4AAaRf4p3UJIXQQB6vPlBio7Rs8gGThbMv02QHs+s=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=hbxrgyxx6BFw8s7ol86ak2XN/m5dn8iNbseaNBqkfFpZdpywaDy7PbC/3HOz9qpPT
	 hpj+/LDtg+tT/6sN5MyLYnhBNi6uEskHmUbU084E6LMS166zf4FLiUNPKqxryww81m
	 U28NoNQ88qU8HBTt1fDImh99HH7cFtq6XdBj2kGp1NLrZizY57IjwILnzjcxxQCLhT
	 3wkO3XuF1gq6QETotn4Uj5zGJpVJo2cxN7eVFaPZ9XsxIAYWhqviAF8eE9YJ10TSX3
	 B4ZQ54lUxvKtUeHLj1e+iBUhYSHzA0ubaAt0Goiz3ChPs056JuRnAfLkx3IXVdcOZ2
	 To2X5VfMYMaWw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ACB544716D;
	Thu,  5 Nov 2026 08:17:18 +0000 (UTC)
From: Isaac Adjei via B4 Relay <devnull+code.isaacadjei.me@kernel.org>
Date: Thu, 05 Nov 2026 08:16:51 +0000
Subject: [PATCH] gpio: mpfs: reject unsupported interrupt types
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
Message-Id: <20261105-gpio-mpfs-irq-type-v1-1-cbb2b0b2a807@isaacadjei.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBtII4muEi1Kx5pFahpRRHdPW
 r7F/w9kSkwZevFAopMzB18gKwFmnfxCyLYYVK20lHWLS+SAW3QZOe143JGQGm061czGWQ0ljIk
 cX/90GN/3AyioTb1kAAAA
X-Change-ID: 20261105-gpio-mpfs-irq-type-e36c823bcfd6
To: Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Dan Carpenter <error27@gmail.com>, Isaac Adjei <code@isaacadjei.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793866638; l=1787;
 i=code@isaacadjei.me; s=20261105; h=from:subject:message-id;
 bh=RPHB+79SRzi3MO4cqrlIZyGYkUrVv21I2XEOqLhYUno=;
 b=fFDDILoO4M0UxwIpenwFbNGJG0/z4thpkU2owNKbMEFvFJ2+2Fw0TJ7pG2PG/Yd9BnSqRfuuC
 2eygNlMXFfxBi6tBkhb9N+FkxBtISiPq5e7WZCwWSl5xEAZcw7nXG0d
X-Developer-Key: i=code@isaacadjei.me; a=ed25519;
 pk=VhIIXFXv1g0LAdmG85V9QxWkeBc0KGdKUVH/4o0lWco=
X-Endpoint-Received: by B4 Relay for code@isaacadjei.me/20261105 with
 auth_id=1415
X-Original-From: Isaac Adjei <code@isaacadjei.me>
Reply-To: code@isaacadjei.me
Content-Transfer-Encoding: 7bit

From: Isaac Adjei <code@isaacadjei.me>

The switch statement in mpfs_gpio_irq_set_type() does not handle
unsupported interrupt types. For example, IRQ_TYPE_NONE is not listed.

When an unsupported type is passed, interrupt_type remains
uninitialised. Its undefined value is then written to the GPIO control
register. The function still returns 0, making the caller believe the
operation succeeded.

Add a default case to return -EINVAL for unsupported interrupt types.

Smatch reported the following warning:

  drivers/gpio/gpio-mpfs.c:144 mpfs_gpio_irq_set_type() error: uninitialized symbol 'interrupt_type'.

I built the driver with W=1 and got no warnings. I also reran Smatch
and confirmed that the warning was resolved.

This is compile-tested only. I do not have access to PolarFire SoC
hardware for runtime testing.

Fixes: e57b53f0f36a ("gpio: mpfs: Add interrupt support")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202411080149.bOpayvf6-lkp@intel.com/
Signed-off-by: Isaac Adjei <code@isaacadjei.me>
---
 drivers/gpio/gpio-mpfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
index 7f0751d7b..0b7a48e0a 100644
--- a/drivers/gpio/gpio-mpfs.c
+++ b/drivers/gpio/gpio-mpfs.c
@@ -138,6 +138,8 @@ static int mpfs_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 	case IRQ_TYPE_LEVEL_LOW:
 		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_LOW;
 		break;
+	default:
+		return -EINVAL;
 	}
 
 	regmap_update_bits(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index),

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261105-gpio-mpfs-irq-type-e36c823bcfd6

Best regards,
-- 
Isaac Adjei <code@isaacadjei.me>


