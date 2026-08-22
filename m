Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92A839060B
	for <linux-gpio@vger.kernel.org>; Sat, 22 Aug 2026 21:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787434810; cv=none; b=COzaV1g8jfMfNpg5fVYtfwvNjV5Rf14GH0Jd/wEFyMPhek/EWXZ2n4OWxU2131Ko+q5jJtt4J+veMDcyOkdZTNeqZy3m0AHmcL1lk/cvVatxxKA36aIr23laSaV/8TueQJqICx0BvLdYsTOfsxjnrTWorFwB2c+17uDdj0SlchU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787434810; c=relaxed/simple;
	bh=KVdVCQFws2YHcTf23OIbqpRHGvWtL05gPa/MIQhexKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bPNvu30dT0HrjoM4eSEDaGcDiyTqzo6REte91jguSqIXKIX/QGWGCdW7VlJq5sxXYEVAIyqmQ2/maGtJD1z0bTG5uA8TCn96bgZCbkWJNBoMvi2wfd/ye0NfUND6Ym3cgtyDHAFTSsAg3F120J6BrQC/Ro2jIdi8Pk5obdZyyBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCZ626GC; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCZ626GC"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1671ec8692so320553066b.0
        for <linux-gpio@vger.kernel.org>; Sat, 22 Aug 2026 14:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787434804; x=1788039604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rgMbZ8S6nkK5E2O40RbnDFU7z8jdbPLfNie0mYT0a4w=;
        b=fCZ626GCLhBsDRzFUNLU/YDlvTHSp3ZLtaj/x8sIhfDruvwrr/H0AKWZkCSolUukZF
         WQojYuU4cwqBEAfa5fBXHJrNUhUUbex28qO4zNaEMXlJW3pmjzlJiBX5Ixit2mVMWiBW
         qGBfuaowEhbb1BAAU3huh+a/+GkL0PzLP3tNMrr41/lVgXKqV+PdIGAjv5vIdkKd2YV9
         vM3sA4siiq1uxAEkNYnFBJRN2w1uxc0isKVRnuX6Gfgxenw4WVYrR9iK3EJfXrKt91ZV
         MSD4HSHdPs3yfPSPHEWcv97lEEFe5IgCo8NW2c0c2xZ7v2vBSE0Z+bOzokZV4OxOIR1b
         jN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787434804; x=1788039604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgMbZ8S6nkK5E2O40RbnDFU7z8jdbPLfNie0mYT0a4w=;
        b=ddopo/P3KpVSDldNwyR5zsPXyJu5vnFoQ+i06sV88SQ+5SwOtRxgzUajq/JJEMnnnW
         Ejmee1dOiS+qKKk2TRCcaoYCEicwWe+O88LOVXn/zzLW9LdK5ZA+g8uGTOMKiXBzZl6D
         50t1yf9e2kq6+yvagk6CWLzPaCfaq4n3kCb2RZlmOXCD+GDCxRQr67h+GA+xILWfkdLL
         DQ3NS8VoWNBf7CwU9GsdT/fpYsBFV9M9Urhm3oC5djukkXJIRFUMvzbymXJB1zlstx96
         I6kSUPal0Sg/gs00s3VYJflUwbTn3d3pGrktK+QTQD1IWIkq/hLnsxcBonjZ9KeEd1tb
         2zfg==
X-Forwarded-Encrypted: i=1; AHgh+RoPbqrdsLTyit75uO4SO3o1kzsK+FLNTj+CIuBg0kz35pdMrJ4KCQvWhvs5l1++iwHHN+wt3eHN5NWF@vger.kernel.org
X-Gm-Message-State: AFuF++muE3x3YX50PzGaarwjuXRAENdIy9CU4QXRUk6BawsF4r0tcD2R
	GUC5Fb838iHn+UN9+8EHJRr7LgqtjS8k8PwO8J7z4DHyG76kky0FgFmQ
X-Gm-Gg: AR+sD12RGPHscKzDDp/U1jNFZp11i26/zgyucOy4HOUREGkvTBeelj4lvM7ibN1NIyQ
	Tr/8ETdCL3CdFYahZebQ9NW49F8T494GMUDXOdBdv5IdzsY5Zl5/KplOy3B7b9WwjLlD9r3pEq6
	qvdVHFDXlKt7dFWISjBL71RkGXqMUc6pk9JsygWF6NgtoLZYQG8E8nWyQi68ZU9LX+uu6WtS1fm
	TDSfS+fyj4yozIwKz4ancJCl5RbCqZdeNTcoQROMOcqbZbNrectP1gEtL7j5mbv0FWklRmJgzcq
	UVIoPKVtvMrwB8Fgj37Rdrr97YuUTKlFKIdOToOsvukxdykcNr5TgfGyl+g5MpPHjAk9bZI7kJF
	/oSQNqgif/98WKAtBjUDLN7+JJbmPxP4lvro2EEADfHrKTckRJ5O++LPnUt1mQoY/pKAmKkCJUA
	mZXqWzbPxMP6h9WKBovfk/HG6ik7RKm2jdXabcwJDXmfAcS8c/+d3ajfSvh+VL+HWl3EYp7g==
X-Received: by 2002:a17:906:7316:b0:c19:45e3:2f57 with SMTP id a640c23a62f3a-c2491cbca79mr901591266b.9.1787434804173;
        Sat, 22 Aug 2026 14:40:04 -0700 (PDT)
Received: from m2.. ([37.142.151.124])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c24966f99basm466778466b.37.2026.08.22.14.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 14:40:03 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	Christina Quast <contact@christina-quast.de>,
	linux-input@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH 00/13] HID: ft260: add UART and GPIO support, plus I2C fixes
Date: Sun, 23 Aug 2026 00:39:28 +0300
Message-ID: <20260822213941.98882-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mainline supports only the FT260's I2C bridge. This series adds the
UART/TTY interface and GPIO on top of it, and carries the I2C fixes made
alongside them - two years of out-of-tree work [1], now replayed upstream.

It picks up work that stalled twice: Christina Quast's serial driver,
posted as v4 and v5 and never applied, and my own pre-UART GPIO series
from 2023. Patches 1 and 3 link both threads. This is a new series rather
than a v6, being much more than the serial driver now.

The patches keep the order and the granularity in which the work was
developed, so that authorship stays visible: squashing would fold several
people's changes under one name. The UART and I2C changes also interleave
in the code, so regrouping them by interface would mean a rewrite and a
full retest. Only adjacent commits were squashed. Patch 1 is Christina's,
patch 10 is Rio Liu's.

Tested on a UMFT260EV1A with a 24LC512 EEPROM. I2C - reads and writes
that cross the 60-byte write chunk and the 60/180-byte read chunk caps,
SMBus byte-data and block reads, and the shortened read timeout with the
abort path of patch 13. UART - a 2.8 MB pattern in both directions at
115200 and 1.5 Mbaud against an FT2232 peer, without flow control and
with XON/XOFF and RTS/CTS, plus DTR/RTS toggling over TIOCM*. GPIO -
through libgpiod and legacy sysfs. Every commit builds with W=1, and
checkpatch --strict reports no errors and no warnings across the series.

[1] https://github.com/MichaelZaidman/hid-ft260

Christina Quast (1):
  HID: ft260: add serial driver

Michael Zaidman (11):
  HID: ft260: uart: bring-up fixes
  HID: ft260: add GPIO support on top of UART
  HID: ft260: i2c: reduce driver module loading time
  HID: ft260: i2c: silence sysfs store big-numbers
  HID: ft260: i2c: reduce bus-error message severity
  HID: ft260: uart: enable flow control
  HID: ft260: uart: add modem pins control via ioctl
  HID: ft260: gpio: group sysfs attrs per HID interface
  HID: ft260: i2c: fix large write transaction failure
  HID: ft260: workaround for TN_189 errata endpoint STALL after
    enumeration
  HID: ft260: i2c: abort in-flight transfers with STOP before reset

Rio Liu (1):
  HID: ft260: uart: fix active-low RTS/CTS/DTR/DSR polarity

 drivers/hid/Kconfig     |   10 +-
 drivers/hid/hid-ft260.c | 1967 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 1830 insertions(+), 147 deletions(-)

-- 
2.43.0

