Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DB4230BDB;
	Tue, 28 Jul 2026 07:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.78.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223806; cv=none; b=ATFSVrszbp0pXcLgn+CLqJdPs74ilATzBZWxMCIZBQIMbVvfVal/0ViyZsLFJzAKhkbmNXEwUkyNbw1rwvdGgqXYf/xuWacDWrMSdklp+TNv4wRJK8vAgap5WmrCZigAm2cJ0wk9+UmOR0mZtTx25Wn3cThd5P9DkytWl7iexWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223806; c=relaxed/simple;
	bh=GholajZHT61scFxDQZ9voUFwU0/V2G9xFEXtyMfd8hw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SF1X9h39KVANJFT2L6DwO7qVKerQvuZkXuxchJ2hdE81VtHVU+w7p327xtxGjip0g8U6jp1j5K2VerbL7Ua4E92yRhQzclMX7xX3naEX2vD0B3EOmmKpMWH55Rrhhl3CaTpYZrRNLK5JDfhIZZ+gL/CFSRzq3TpUQjSaea+/AEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=13.76.78.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0006800LT.eswin.cn (unknown [10.12.96.77])
	by app1 (Coremail) with SMTP id TAJkCgCHGm9uWmhqjHc3AA--.4254S2;
	Tue, 28 Jul 2026 15:29:53 +0800 (CST)
From: Yulin Lu <luyulin@eswincomputing.com>
To: linusw@kernel.org,
	samuel.holland@sifive.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	Yulin Lu <luyulin@eswincomputing.com>
Subject: [PATCH v1 1/1] pinctrl: eswin: Fix Handling of PIN_CONFIG_PERSIST_STATE
Date: Tue, 28 Jul 2026 15:29:06 +0800
Message-Id: <20260728072906.871-1-luyulin@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgCHGm9uWmhqjHc3AA--.4254S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZrWfuFWkur45XrWfJFW3Awb_yoWkGFb_CF
	W8ArWxKwn8GFsrZr12qrs3ZFy0kF48urn2grZ2qa4fCryDXa4jqryv9r98Ww18Gr1UJFZr
	Jr1DW34fArnrWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
	9x0JUBVbkUUUUU=
X-CM-SenderInfo: pox13z1lq6v25zlqu0xpsx3x1qjou0bp/

The EIC7700 pinctrl driver does not handle PIN_CONFIG_PERSIST_STATE
specifically, and returns -EOPNOTSUPP from the default case.

Since all pins on the EIC7700 SoC are persistent over suspend, the
correct behaviour is to accept this parameter and return success.

Add an explicit case for PIN_CONFIG_PERSIST_STATE that returns 0 to
prevent errors when this parameter is set.

Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
Fixes: 5b797bcc00ef ("pinctrl: eswin: Add EIC7700 pinctrl driver")
---
 drivers/pinctrl/pinctrl-eic7700.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-eic7700.c b/drivers/pinctrl/pinctrl-eic7700.c
index d553ec20c619..09a3b097383c 100644
--- a/drivers/pinctrl/pinctrl-eic7700.c
+++ b/drivers/pinctrl/pinctrl-eic7700.c
@@ -422,6 +422,9 @@ static int eic7700_pin_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			else
 				value &= ~EIC7700_ST;
 			break;
+		/* All pins are persistent over suspend */
+		case PIN_CONFIG_PERSIST_STATE:
+			return 0;
 		default:
 			return -EOPNOTSUPP;
 		}
-- 
2.34.1

