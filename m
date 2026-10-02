Received: from mail.adriel.eu (mail.adriel.eu [51.75.77.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4681531716D;
	Fri,  2 Oct 2026 16:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.75.77.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958027; cv=none; b=M9u8STo11/2/QEnbrL8YIBQwxEc+HLf25vuzbJds+jC+gYXzbgCGraUJFf36dO16NoRW61AvsIoEX4DiGYfal8Tk6TH9n5RPwO6JXb1Tt81t64MB7sPX7vSmsJqWJ6GTN3TolGsHbGKW5NI1ZGfDUktwfL3DMB7QQPzDGyL61sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958027; c=relaxed/simple;
	bh=kGwamAOcW69QieVU0Eb5n3DQQ18Its6iwsGa4DSTG+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k0Up4AOvLbSBPO6I10U01JY1wJllILi/I6EYwYPKijjB337Q7SHJ4AGEX6ZrAJcAqVmVvYIe+Dj6mHtnB+PlF+sebZEzPcI94Wba+MOf4DTn5j5KHbCVU3Znjuwim98ZtLJSZh0n8ztk6Q17o/ZzEVcWuFEt03eu9e5B+sv9uMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=adriel.eu; spf=pass smtp.mailfrom=adriel.eu; dkim=pass (2048-bit key) header.d=adriel.eu header.i=@adriel.eu header.b=fZFBEGoQ; arc=none smtp.client-ip=51.75.77.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=adriel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adriel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adriel.eu header.i=@adriel.eu header.b="fZFBEGoQ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1020F261ACF;
	Fri, 02 Oct 2026 12:11:44 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adriel.eu; s=dkim;
	t=1790957510; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=rT6Ok/TgsDsjnHJNnNtEOfsiLGxANnzqLzd/ug7vm/s=;
	b=fZFBEGoQ2HSiEJgD6RIFFwytlm9LB/v0DbiugHciPs+Uwul3i0zKpaxUViyaXX6lBd2Afy
	8+3sC8KhlmTkErPYnKecKn9KqEAawrZiBSgIVB1j/r151nBpGIgxwZoi5nDaUBKAFjFP6/
	I//rjUXgO+1w3Cf9RzNj2LB4NULNKtQ9mv7Mu59M+36/dXRLuQHq7h+Hg6Ds7Q3Fe3suD1
	SQkuirFZWt50JHQB2QPmVtxZOd5soxYLayVe3xG1f8U1LPGf3ZsLG3+WtWdNLwpZAJS2gB
	5IJuG655JBSJCZd6aEL9XIqaOXi7Z4ZGLm66P0hR2vJHLytx6qgc57AmYE0Xlg==
From: Adriel Santos <adriel@adriel.eu>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Nitheesh Sekar <quic_nsekar@quicinc.com>,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Gilberto Conde <gilbertorconde@gmail.com>,
	George Moussalem <george.moussalem@outlook.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on gpio12
Date: Fri,  2 Oct 2026 13:09:58 -0300
Message-ID: <20261002160958.908424-1-adriel@adriel.eu>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The pingroup table has gcc_plltest at function 5 of gpio12 and does not
offer pwm2 on that pin, so the pinmux core rejects a request for pwm2 on
gpio12 as an invalid group. On the hardware, function 5 of gpio12
carries the PWM2 output: the Xiaomi AX3000T v2 drives its blue status
LED from PWM2 on gpio12.

The vendor kernel shipped on that router (Linux 4.4, stock firmware
2.0.28) has pwm2 in this slot. Its pingroup table, as read from the
firmware image, lists these functions for gpio12:

  gpio, blsp0_spi, blsp0_i2c, blsp1_uart0, _, pwm2, qdss_tracedata_a,
  _, _, _

and has pwm3 at function 4 of gpio13, matching commit c6c159fcdb4e
("pinctrl: qcom: ipq5018: add missing pwm3 function on gpio13").

Measured on the board: with gpio12 set to each of the 16 function
values in turn, and PWM2 held at 0% and then at 100% duty, the pad
level read back from GPIO_IN follows PWM2 only at function 5. There it
does not follow PWM channels 0, 1 or 3, and the LED switches with PWM2.
Functions 4 and 7, which the table leaves empty, do not carry PWM2.

Put pwm2 in function 5 of gpio12 and list gpio12 in pwm2_groups. Drop
gpio12 from gcc_plltest_groups: none of its functions is gcc_plltest
any more, and selecting it would trigger the WARN_ON() in
msm_pinmux_set_mux().

Fixes: 725d1c891658 ("pinctrl: qcom: Add IPQ5018 pinctrl driver")
Assisted-by: LLM
Signed-off-by: Adriel Santos <adriel@adriel.eu>
---

Notes:
    - The vendor table was read from the stock kernel image: each pingroup
      descriptor was found by its register offsets (0xc000 for gpio12), and
      its function array decoded with the image's own function name table.
      That table still lists gpio12 in gcc_plltest_groups, which this patch
      drops for the reason given above.
    - George Moussalem's OpenWrt port of this board first put pwm2 on gpio12
      at function 7. At function 7, and at function 4 (pwm3's slot on
      gpio13), the pad stays high at both 0% and 100% duty, which is why the
      message mentions those two.
    - This applies on top of George's "pinctrl: qcom: ipq5018: update PWM
      groups and corresponding pin functions", which Bartosz has applied for
      v7.3; the two touch different pins.
    - Tested on the Xiaomi AX3000T v2 with an OpenWrt 6.18 kernel carrying
      the same table change: the blue LED (pwm2 on gpio12) and the yellow
      LED (pwm3 on gpio13) switch with their PWM channels. This patch was
      build-tested on pinctrl-qcom/for-current (arm64, W=1, built-in and as
      a module). It has not been booted on a mainline kernel.
    - Prepared with an AI coding assistant (Claude). It found the mismatch
      while I was bringing up the board, wrote the measurement and
      table-decoding scripts, and drafted the change and this message. I
      confirmed the LED behaviour on the hardware and reviewed the change
      and the evidence.

 drivers/pinctrl/qcom/pinctrl-ipq5018.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5018.c b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
index 84392fe258..28b23bb5e1 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq5018.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
@@ -361,7 +361,7 @@ static const char * const blsp1_uart0_groups[] = {
 };
 
 static const char * const gcc_plltest_groups[] = {
-	"gpio10", "gpio12",
+	"gpio10",
 };
 
 static const char * const gcc_tlmm_groups[] = {
@@ -555,7 +555,7 @@ static const char * const qdss_cti_trig_in_b0_groups[] = {
 };
 
 static const char * const pwm2_groups[] = {
-	"gpio44",
+	"gpio12", "gpio44",
 };
 
 static const char * const qdss_cti_trig_out_b1_groups[] = {
@@ -688,7 +688,7 @@ static const struct msm_pingroup ipq5018_groups[] = {
 	PINGROUP(9, sdc1_clk, qspi_clk, _, qdss_tracedata_a, _, _, _, _, _),
 	PINGROUP(10, blsp0_spi, blsp1_uart0, led0, gcc_plltest, qdss_tracedata_a, _, _, _, _),
 	PINGROUP(11, blsp0_spi, blsp1_uart0, _, gcc_tlmm, qdss_tracedata_a, _, _, _, _),
-	PINGROUP(12, blsp0_spi, blsp0_i2c, blsp1_uart0, _, gcc_plltest, qdss_tracedata_a, _, _, _),
+	PINGROUP(12, blsp0_spi, blsp0_i2c, blsp1_uart0, _, pwm2, qdss_tracedata_a, _, _, _),
 	PINGROUP(13, blsp0_spi, blsp0_i2c, blsp1_uart0, pwm3, qdss_tracedata_a, _, _, _, _),
 	PINGROUP(14, pcie0_clk, _, _, cri_trng0, qdss_tracedata_a, _, _, _, _),
 	PINGROUP(15, _, _, cri_trng1, qdss_tracedata_a, _, _, _, _, _),

base-commit: 19fc4240358be2a25ce8e0a49a2819588ed61c5d
-- 
2.47.3

