Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A9F3CFF49;
	Mon, 28 Sep 2026 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588931; cv=none; b=lz6nhY5zA1eBZ4heXhTaEDpSnNhBaEYUo3ZNndW6v6et/mDCaWH//+TYGSynB5DsjoMuuMSQtGz5wABKjtV7Z/bXo4vGKDJkDadmK+HBGg6IZ9FedrAbqEF53AQsgUVsXiknt0YAHywrRU0FwcE3fhMK9xVrxyPRpE1fU30I+go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588931; c=relaxed/simple;
	bh=hF95EN/AY0O9BeW6PyO06bXHa+vhGl02HfCgvZqYHJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PHRmm1MZWJk7FvcE4PRERWxvdWEHRe5q/B63VQUyHJ8PwEJKSVSF4kve35xJR9nfkbMOJ6+fAtuYeaYCeb2ftp4T7s5BDoqP3WjsVJLO15jD6C72VgQIOygp1vhvc+PPgeVFfHZwtCPS9YdODa59spFWfrqR7rJyuo8d/IiMW2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qyk7gJFl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qyk7gJFl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 039B6C2BCB3;
	Mon, 28 Sep 2026 09:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790588931;
	bh=hF95EN/AY0O9BeW6PyO06bXHa+vhGl02HfCgvZqYHJs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Qyk7gJFlbyV89cghFTvvs5MIUrvLVxWHsa5MRGTWJeTA8xfO5f2niLJngpSp3zIVu
	 jyC9vHUU+HMj5E8liO3F1A+yKPdjg7JjV1Fgz8B14WaXBQsyD20XuVGinnWE2wiXVJ
	 layFnxfJv5WKM3rHoWtGZ/Hq+O2LOVcAjPE1EC+NMHuYUnKQkiOl7JBYPb6zJJyLPp
	 /HlnqB2Q+/Y3wJSJIkR6RCbuBNEWPTJVHnb3grHkGwzEvO0A7cFVfJLpw/7mKDryj9
	 9+WQNEUCal46+a0nllp25c3fZowz8EszHqYEO0E8KNkeDkKTZa9MD/J+unqbpxkXwS
	 SXcgAiGiVMemg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6713CA5FA2;
	Mon, 28 Sep 2026 09:48:50 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 28 Sep 2026 13:48:47 +0400
Subject: [PATCH v2] pinctrl: qcom: ipq5018: update PWM groups and
 corresponding pin functions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-ipq5018-pwm-functions-v2-1-87bbcd706bc6@outlook.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CQAxFr0K6tmbaAAFX3sOwwKFIozA4A6gh3
 N2RC7h8P3nvrxDEqwQ4JSt4WTSoGyLwIQHb1cNNUJvIwIZzU3KKOj4zQwWOrx7bebBTFAKyWMN
 ETZ5ZguiOXlp9791LFbnTMDn/2W8W+q3/igshYVGWpk6lyK7cnt08PZy7H63rodq27QuFtTu5v
 AAAAA==
X-Change-ID: 20260924-ipq5018-pwm-functions-2ec0211d65c1
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790588929; l=3984;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=bdNTTmgNNZzHtCyMcXaP+/5YczTyR2tEZAgMtevFbFU=;
 b=2UCGNtGW7pfm1fEyAW1VzrN5fppGbdd/7aXd8LKKnjNStfGN3AzMNmGl6cGKbbbfO6sv9iHQy
 CDhB4z9wOhABY1h/5rWh3fNVzyrQbzzzUytbjqjqWxoeYKQufvBwy1J
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

On multiple Linksys routers, GPIOs 1, 30, and 46 drive the PWM LED on
the PWM1, PWM3, and PWM0 channels, respectively.
Update the corresponding PWM groups to include these GPIOs and allocate
the PWM functions to empty slots in the relevant pin groups.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
Changes in v2:
- Updated the commit title and message to reflect this isn't a fix for a
  regression but rather an update for specific IPQ5018 boards.
- Link to v1: https://lore.kernel.org/r/20260924-ipq5018-pwm-functions-v1-1-8990a4e85b2f@outlook.com
---
Changes in v2:
- Updated the commit title and message to reflect this isn't a fix for a
  regression but rather an update for specific IPQ5018 boards.
- Link to v1: https://lore.kernel.org/r/20260924-ipq5018-pwm-functions-v1-1-8990a4e85b2f@outlook.com
---
 drivers/pinctrl/qcom/pinctrl-ipq5018.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5018.c b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
index 84392fe258c9..74fccdd5146a 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq5018.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
@@ -539,7 +539,7 @@ static const char * const qdss_tracectl_b_groups[] = {
 };
 
 static const char * const pwm0_groups[] = {
-	"gpio42",
+	"gpio42", "gpio46",
 };
 
 static const char * const qdss_cti_trig_out_b0_groups[] = {
@@ -547,7 +547,7 @@ static const char * const qdss_cti_trig_out_b0_groups[] = {
 };
 
 static const char * const pwm1_groups[] = {
-	"gpio43",
+	"gpio43", "gpio1",
 };
 
 static const char * const qdss_cti_trig_in_b0_groups[] = {
@@ -563,7 +563,7 @@ static const char * const qdss_cti_trig_out_b1_groups[] = {
 };
 
 static const char * const pwm3_groups[] = {
-	"gpio45", "gpio13",
+	"gpio45", "gpio30", "gpio13",
 };
 
 static const char * const qdss_cti_trig_in_b1_groups[] = {
@@ -677,7 +677,7 @@ static const struct pinfunction ipq5018_functions[] = {
 
 static const struct msm_pingroup ipq5018_groups[] = {
 	PINGROUP(0, atest_char, _, qdss_cti_trig_out_a0, wci_txd, wci_rxd, xfem, _, _, _),
-	PINGROUP(1, atest_char, _, qdss_cti_trig_in_a0, wci_txd, wci_rxd, xfem, _, _, _),
+	PINGROUP(1, atest_char, pwm1, qdss_cti_trig_in_a0, wci_txd, wci_rxd, xfem, _, _, _),
 	PINGROUP(2, atest_char, _, qdss_cti_trig_out_a1, wci_txd, wci_rxd, xfem, _, _, _),
 	PINGROUP(3, atest_char, _, qdss_cti_trig_in_a1, wci_txd, wci_rxd, xfem, _, _, _),
 	PINGROUP(4, sdc1_data, qspi_data, blsp1_spi1, btss, dbg_out, qdss_traceclk_a, _, burn0, _),
@@ -706,7 +706,7 @@ static const struct msm_pingroup ipq5018_groups[] = {
 	PINGROUP(27, audio_txmclk, wsa_swrm, audio_txmclk, blsp2_spi, btss, _, qdss_tracedata_b, _, _),
 	PINGROUP(28, audio_txbclk, wsa_swrm, blsp0_uart1, btss, qdss_tracedata_b, _, _, _, _),
 	PINGROUP(29, audio_txfsync, _, blsp0_uart1, _, qdss_tracedata_b, _, _, _, _),
-	PINGROUP(30, audio_txd, led2, led0, _, _, _, _, _, _),
+	PINGROUP(30, audio_txd, led2, led0, pwm3, _, _, _, _, _),
 	PINGROUP(31, blsp2_spi0, blsp1_uart1, _, qdss_tracedata_b, eud_gpio, _, _, _, _),
 	PINGROUP(32, blsp2_spi0, blsp1_uart1, _, qdss_tracedata_b, eud_gpio, _, _, _, _),
 	PINGROUP(33, blsp2_i2c0, blsp2_spi0, blsp1_uart1, _, qdss_tracedata_b, eud_gpio, _, _, _),
@@ -722,7 +722,7 @@ static const struct msm_pingroup ipq5018_groups[] = {
 	PINGROUP(43, pwm1, qdss_cti_trig_in_b0, wci_txd, wci_rxd, xfem, _, _, _, _),
 	PINGROUP(44, pwm2, qdss_cti_trig_out_b1, wci_txd, wci_rxd, xfem, _, _, _, _),
 	PINGROUP(45, pwm3, qdss_cti_trig_in_b1, wci_txd, wci_rxd, xfem, _, _, _, _),
-	PINGROUP(46, led0, _, _, _, _, _, _, _, _),
+	PINGROUP(46, led0, pwm0, _, _, _, _, _, _, _),
 };
 
 static const struct msm_pinctrl_soc_data ipq5018_pinctrl = {

---
base-commit: 3d7783543c2646af69ad65825e810060494bea21
change-id: 20260924-ipq5018-pwm-functions-2ec0211d65c1

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>


