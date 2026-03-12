Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9C62F9D98;
	Thu, 12 Mar 2026 08:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773303523; cv=none; b=GPcLDOlGRNF/1iI2JagIcA4iBnSW0fZtOvB9ng9ChOmsTJcnLjVaZMTduj7vOxMuyhcUe7o+LNk8RKYZSklzkmD39rHhoXBwsHKPSQCVBqsj4IIRD/x+x7Xll0cwGVvxpvqbrKAFmURo59Ppfg2WGXT7MgMFMF9UArCAMBMiUes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773303523; c=relaxed/simple;
	bh=zaiw6ohbC9zCzTRpwnLAe3c7LEjMMvMfCa83XflODHk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MmBdgKRLo7E/eQzXJKgO3Urh5r6U7MJiWH/Pgg27xv3GYNgFWZbVGv6yHq0BaqA8PIZcK5yBEv7Hf02nQnWRrmJQ8fNRJRLwCjLq3yYkk79tmdlM9xJATkCm+wfSIwGhGnwHB7leMM8M1vfgbp2gZQoOhfbDRSo9qnpOaPaDlqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xv18C9rG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xv18C9rG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504CCC4CEF7;
	Thu, 12 Mar 2026 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773303523;
	bh=zaiw6ohbC9zCzTRpwnLAe3c7LEjMMvMfCa83XflODHk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xv18C9rGMeCRDNgcgnuV6dLDJo5QaRsfDSyclftrain5i3x72szmFg1DLzuYLZshB
	 8+yTqt8d1MTdzNnKoNrB9RFZ9PwgnWSUvrSQcEoiRSYUxzpjgRn54SRZzbIPYHAam6
	 X9DZegf2Mj2T/qFHxe5OK0YX7JWM9i6rqdDTIlON1iCZ/cEJWRU++W0o5IUPQ4bSZn
	 HHJrmv3Clmq2+MIST8R2dPFQloQTosCAdTQD4vWjzuAeRjz5oDp57W+RsOr8KTmlRd
	 FVQfiu5bmj86rCBAFfqZdNmclWFS5PJs7twUGqA4aR7wEIBrzaKZwZjzwCIj3jBuSY
	 FDPgXr5tZENMw==
From: Arnd Bergmann <arnd@kernel.org>
To: 
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: defconfig: enable CONFIG_MFD_STMFX instead of PINCTRL_STMFX
Date: Thu, 12 Mar 2026 09:17:45 +0100
Message-Id: <20260312081805.3020612-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260312081805.3020612-1-arnd@kernel.org>
References: <20260312081805.3020612-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

PINCTRL_STMFX now depends on MFD_STMFX instead of selecting it, so
adapt the defconfig to pick the right one again.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c102c4acdd8f..728b36ad3a08 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -481,7 +481,6 @@ CONFIG_PINCTRL_MCP23S08=m
 CONFIG_PINCTRL_MICROCHIP_SGPIO=y
 CONFIG_PINCTRL_OCELOT=y
 CONFIG_PINCTRL_PALMAS=y
-CONFIG_PINCTRL_STMFX=y
 CONFIG_PINCTRL_OWL=y
 CONFIG_PINCTRL_S500=y
 CONFIG_PINCTRL_MSM=y
@@ -627,6 +626,7 @@ CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK8XX_I2C=y
 CONFIG_MFD_RN5T618=y
 CONFIG_MFD_SEC_I2C=y
+CONFIG_MFD_STMFX=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_PALMAS=y
 CONFIG_MFD_TPS65090=y
-- 
2.39.5

