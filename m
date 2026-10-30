Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399820;
	b=uDpmeAYcj9QYhpdcFjd/iOC2qu98i/cBDfHT/hBQKrQOjMe0FG/pm1s3KOyfJZq52NkZ
	 NKxWpmTRKFVDu1bSoz7HjdyxwqgDBVuduoW+2G38OegfkE/f++toD6c0MCKjWZgk3IZGE
	 yl/CtMulcUp6E/p2+fBQt7MQVZ5wX215xLtH+ml+gfoh6qJDltQOgKawiMRVISogVZbWo
	 3HPSUpWA5emBlE516d200p3FDraUQTYA/0kqiRuByya8lcN04P1PQn2P5XAIE4FF8Mz25
	 giKuZkQqAdeDO0B1N9Jb69bphSW/uGlbh/+caApthjFaGO1IuffKqeUsUE45IAqjzfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ut+9IA7+uboYNcIm8+J4cxAe0hs4W7L46fYN/DTBCtw=;
	b=0tNKQ89jq7AcbgbfpjjNcLtL7xoObaD2nsFm6QSueClUJA/KD18M17HVqntSDeI6Z0Ff
	 xcTxyUJpVMV0V3mixRwpuasCQFDb6qqtugoTXEfvAvwKSxhaa1g9vu7LPxpgR9xPSMe5P
	 G8B+Xp8cnaaWwch1qQ3u+l5wSTmO8B/dCiIdkKgYIQL3IcpfNAz5j2w3umjJbbR2S4mnw
	 z8PukhRzELmgFunc/j7jEFF1cA1P2fP8De88OjMFlwX7o3bRcfV3WpVXYngMwKQo8RFmR
	 nN5QRi6cOJg8Sb4qIw0ERSSKy1B5qF+41OszINVbMoAlc9RZtLLhFQFqKM8g5/gjxgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LeQ3hKdr;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F933606A320
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 22:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F933606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LeQ3hKdr
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e09aa5264so609514f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793399818; x=1794004618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ut+9IA7+uboYNcIm8+J4cxAe0hs4W7L46fYN/DTBCtw=;
        b=LeQ3hKdrRiIwJ9WYm2818uTU6CMcLXU7f11PkZfTD8EzLL97P/fnUbqAy9BMBy7E03
         6NPK8ze4FplLeq+oWoDl8osUEVLq7vY0i2zZl33ZWEGfHBt3x7kjE1ug950xIjyIs/r6
         ZQTcm+jnDmaNFUNfpyD6PmhPMVbpEKR8+xqdbUxul3IDlgDYtYOLWIjzZGEoFVG5LllS
         8PvQmfguG0350jsGWGl1AosdCZq9lQTCPAZwKLE0Be979prA6RaajtpJIGRk4Skeq4m9
         EaSqtNO0hDj46Ev/wTqpwvzdMwm9j24iVUDRYeG9stAOQsATLOe+zwS8Y7891vAz745N
         Kl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793399818; x=1794004618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ut+9IA7+uboYNcIm8+J4cxAe0hs4W7L46fYN/DTBCtw=;
        b=fELnylbnFETJnqbYZNlQnYtVmg/aOi/ZuRSUQD5JNsORyqeIyiWdRxvXtTyX7tMPGj
         lUbp/+xf0W+6QiJm6vDJrbg1ttvdi1L7svVzEm5SESVDt7VjcIvH3i7pgqc8ZDbPw6Ud
         8TSaeheQ8SBE/4Lq59gWujuMzd+vKeie1KKwT5ScQcF4au58YymqNU7DLTzvKojK2z+O
         jWSSJpz2NeSIFWWHVJuKt676fbytKFOqIHWQyTTu1ZRZa/lLY/Y9yQw/JBo/U9Xm9KG4
         szRGWwC0nFADX6DZI7AU2q+Uk8CnPBmtC8fetT4vTfjRaQkvuV2TWNKG4QTq1nJLzoKI
         eCeA==
X-Forwarded-Encrypted: i=1; AKwUvBw+43TH5fHSkIdQ1jJTNSxJizZGZV2+eUTZHOypyoZe7Y1o4CN+v/bZmkZvr8qyn+wHU6lajXy32KT6@vger.kernel.org
X-Gm-Message-State: AFq9FYIX5lxFHOiOeHFe0X/NoZgH972g+hGIdQl3nMF+sWSqwG7nleOZ
	cPq9tliWVZqz3r461BxCit3abZzI4o1CKECNI+lPjDwzl8iVYIR9CKhO
X-Gm-Gg: AYBFou3Z6Re4UCjsVgkiQvA9o/F/2qoLAMbx+fKRccGlkuu5uvfFPEZa9dEopGJE/BV
	pmMwJ8s6DkuV9g52Pe6QuNb09qV6M+d8xU6RKLQnteZJ5rCvNymRL7RXUe/n0ZoW4Z8Qve7gVGn
	HuplzgTJW3VIHp5rEXbVuVhZJO3tdDo3XgTtnsKpstl60DPxbMX+jhnbGzRDAFCfoJ/Y6C2dmzd
	lM1gRdSlBz/Yd9LPAWuMk2s30aAmxzxPmSD4w87kTksbRiExfMtG6ukUI9rrkqJVFw+PZsZt6Ud
	ysqlwt8S5H/3T6+u2F3n1kDMYpcy0Vw9vapKaeudpbuFeub72y/SMx2TEAY0zy+LvVjJZh5cqPF
	Yghkt/IRYTsLlza//AtzaBj57+Eb34lAX7c3E8NMuYelE0rNgASaCKk8lQFS8V80ufP0/6UZa0b
	cetexAzHu/AGC2YGhtAygcIclk4I5ox95DJzHuGRUsspYkrwGZAGP5Xzxb/pv5mn5vt9IoEuKdu
	UqOT9EuqtuU6xg9KOXagQeCgYundX8pvI12oYLqiSWbK8xwLxcAbHatsPUFYaLzZqhMlAgg6viX
	gY66M5jvX0GFKIu8N1+18UaBkC8f
X-Received: by 2002:a05:6000:2011:b0:48d:f14a:917e with SMTP id ffacd0b85a97d-48e6e2f24f9mr9160016f8f.11.1793399817797;
        Fri, 30 Oct 2026 15:36:57 -0700 (PDT)
Received: from m2.. ([37.142.145.227])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm5457300f8f.45.2026.10.30.15.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:36:57 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v2 00/15] HID: ft260: add UART and GPIO support, plus I2C fixes
Date: Sat, 31 Oct 2026 00:36:22 +0200
Message-ID: <20261030223637.86907-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Mainline supports only the FT260's I2C bridge. This series adds the
UART/TTY interface and GPIO on top of it, and carries the I2C fixes
made alongside them [1].

Patch 1 is Christina Quast's v4 serial driver, ported to the current
I2C code. Patch 2 holds the fixes it needed on hardware. They stay
two patches, as agreed with Jiri, so that each has its own author.
Patches 7 and 8 add flow control and the modem pins.

The v1 thread:
https://lore.kernel.org/all/20260822213941.98882-1-michael.zaidman@gmail.com/T/#t

As said in the v1 thread, this series lands the current driver first.
The MFD split follows as its own series once this one is in the tree.

Changes in v2:

- Patch 1: the UART config enums are split per field and use the
  UART_ infix from the start (Linus Walleij). Lock, read_lock and
  wait are initialised before hid_hw_open(). Lifetime and TTY fixes
  (reported by Sashiko).
- Patch 2: subject now says what it fixes. FT260_UART_RI_DCD_STATUS
  corrected to 0xE2, as in AN_394 section 4.3. 0xB1 length check and
  wake-up timer re-arm (Sashiko).
- Patch 3: subject drops "on top of UART". linux/bits.h, GENMASK()
  and BIT() for the GPIO masks, FT260_GPIO_MAX renamed (Linus
  Walleij). GPIO shadow, combined direction/value report, uart_mode
  OFF (Sashiko).
- Patch 4: timeout of the last I2C read chunk from its length
  (Sashiko).
- Patch 5: a failed feature report is no longer masked; word stores
  use cpu_to_le16() (Sashiko).
- Patch 6: __func__ is printed once (Sashiko).
- Patch 8: v1 patch 10, Rio Liu's RTS/CTS/DTR/DSR polarity fix, is
  folded in, with Co-developed-by. Error paths of tiocmget and
  tiocmset (Sashiko). The TIOCM ioctls stay; the switch to the
  serial_mctrl_gpio helpers needs serial core changes first, as
  discussed with Linus Walleij.
- Patch 9: subject drops "gpio:". i2c_enable moves to the interface
  that owns the gpiochip, so it changes the mask the gpiochip uses.
- Patch 11: the reset work is flushed on unload, and -ENOMEM does not
  trigger a reset (Sashiko).
- Patches 13 to 15 are new: reject an I2C clock outside 60-3400 kHz,
  return the byte count from the i2c_reset store, and recover a bus
  that a slave holds low.

Testing: two FT260 boards, one in chip mode 0x03 with a 24LC512 and
an FT2232 wired to its UART, one with a 24C02. A pytest suite of 202
tests [2] drives sysfs, the gpiochip, the I2C adapter and the tty. It
ran on 7.3.0-rc4 with this series applied, built with PROVE_LOCKING
and DEBUG_ATOMIC_SLEEP, loading the in-tree module. The second board
was strapped to 0x00, 0x01 and 0x02 in turn; each of the 202 tests
passed in at least one of the three runs, with no lockdep report.
Every patch builds with W=1 without warnings.
checkpatch --strict reports no errors and one warning, for a quoted
kernel log line in patch 15.

[1] https://github.com/MichaelZaidman/hid-ft260
[2] https://github.com/MichaelZaidman/hid-ft260/tree/main/tests

Christina Quast (1):
  HID: ft260: add serial driver

Michael Zaidman (14):
  HID: ft260: uart: fix the serial driver
  HID: ft260: add GPIO support
  HID: ft260: i2c: reduce driver module loading time
  HID: ft260: i2c: silence sysfs store big-numbers
  HID: ft260: i2c: reduce bus-error message severity
  HID: ft260: uart: enable flow control
  HID: ft260: uart: add modem pins control via ioctl
  HID: ft260: group sysfs attrs per HID interface
  HID: ft260: i2c: fix large write transaction failure
  HID: ft260: workaround for TN_189 errata endpoint STALL after
    enumeration
  HID: ft260: i2c: abort in-flight transfers with STOP before reset
  HID: ft260: i2c: reject an I2C clock outside the supported range
  HID: ft260: i2c: fix i2c_reset sysfs store return value
  HID: ft260: i2c: recover a bus held by a slave

 drivers/hid/Kconfig     |   10 +-
 drivers/hid/hid-ft260.c | 2435 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 2175 insertions(+), 270 deletions(-)


base-commit: 720806515cb6921ab05caaa6f470f7054b56385e
-- 
2.43.0

