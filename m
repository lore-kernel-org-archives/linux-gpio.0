Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8FC3C4547;
	Wed,  5 Aug 2026 03:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785900620; cv=none; b=IrqkxaUuEvsk54OhriIB7ul5Y03ryM9w8p4rAlT0xmtq4RK9ev9d0iaFa6hru1Dq64oB0FoSfOUJZoGdU9CL1WMoKZR6VdWpCGcA69qOHNCa1wBJj4+bCT32SMX2K8ODvxLJw+FKVzxKgRI/j6MgV/mTar7FLYKwRNp3+64dlHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785900620; c=relaxed/simple;
	bh=fx1DuAg9HEqxM5McnkCl3EA3FlKtNQUZve7oSEFLZYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ST7HP7JMULVkV5i560qUO5CazDotUbrTju/YGeZbu/QQU8zn5xnRceWWAul0Q0+5Cljx6s1T3TuA8/I6dFftPq86sWE9LN0fKiABWDJsT7VSMo6SjS2MXjiNlbUv15NTa1+bbb1D/EAAAflic92YUDA0s6dBvFr6LBBAj1LM7JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=aWdGyWz2; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="aWdGyWz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=kX
	YywNMh6vzEx1z9jhfiDuQDqbIo2Ie56qyFTxXK1o0=; b=aWdGyWz2d/LJfyqpQp
	UICDhVQ8NnXN8DYYQb6iIEMfInuyV/jJDWmjFmCFvZzVo0bGgj7KceOTXjmoXNr3
	+JuFxrmOOshTQTDOqQthlPwcpCCVnHRXc43BlOmPopVWgM/NU5H6GvX5RX0ti6VG
	MUhh3RPRkptGbYfSxF3GdyBtc=
Received: from fedora (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3P1sdrnJqG4KmNw--.47924S2;
	Wed, 05 Aug 2026 11:29:34 +0800 (CST)
From: Ju Nan <junan76@163.com>
To: antonio.borneo@foss.st.com,
	linusw@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	junan76@163.com
Cc: linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: stm32: fix the unit of the hwspinlock timeout
Date: Wed,  5 Aug 2026 11:28:44 +0800
Message-ID: <20260805032843.36961-2-junan76@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P1sdrnJqG4KmNw--.47924S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF4fXFyxCFWfKw4fKF1kAFb_yoW8Wr47pF
	W3Gwn8CFsYqayak3WkJa1qgFy3GayxJrW8KF92q3yav3Z0yayvqr4rKayjvF9F9rW8Xanx
	tF4Sg345C3Z5CFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piPEf5UUUUU=
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC1B7pm2pyrh6LhQAA3e

HWSPNLCK_TIMEOUT is passed to hwspin_lock_timeout_in_atomic(), whose
timeout argument is in milliseconds, not microseconds:

  atomic_delay += HWSPINLOCK_RETRY_DELAY_US;
  if (atomic_delay > to * 1000)
          return -ETIMEDOUT;

So the driver asks for a 1 second timeout where the comment next to the
macro says it wants 1 millisecond.

The hwspinlock core documents this explicitly:

  If the mode is HWLOCK_IN_ATOMIC (called from an atomic context) the
  timeout is handled with busy-waiting delays, hence shall not exceed
  few msecs.

Pass the value the comment always described. The core retries every
HWSPINLOCK_RETRY_DELAY_US (100 us), so the semaphore is still polled ten
times before giving up, which is far longer than any plausible hold time
on the coprocessor side. A timeout is reported with dev_err() and fails
the pin configuration or the interrupt allocation, so shortening it
degrades gracefully.

Signed-off-by: Ju Nan <junan76@163.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 6a99708a5..dbc9143ec 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -87,7 +87,7 @@
 #define gpio_range_to_bank(chip) \
 		container_of(chip, struct stm32_gpio_bank, range)
 
-#define HWSPNLCK_TIMEOUT	1000 /* usec */
+#define HWSPNLCK_TIMEOUT	1 /* msec */
 
 static const char * const stm32_gpio_functions[] = {
 	"gpio", "af0", "af1",
-- 
2.55.0

