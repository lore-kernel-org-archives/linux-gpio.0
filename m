Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209282;
	b=ZlLbZuD8oF7QSgeP1p9VInjSFb0+fg1DTBaHSA1A1R+UNs4cMAxTDGMQH+GAeX0vKDda
	 MaEDExizZ0nzSmB9gAt//Tu6ktEJNalZXYu93xwq6wAfbJzXbUtChZBuJQzaJEgzG8Ki8
	 wohq52SCRUfEFHGA7Kx2HaUXK6FRRa5RgVawX6b3yaXtAzuQbzecS0GCFD8RwkUF4icIw
	 C0rzBsnLhh/3UfBI7i6glXYzx9+RfK/nZtr4Bzro3D9RxQIHT9Sz2rnQXZpX+wtWhZVPV
	 6v6vPEkeaycPmRTYqgcuNggwF4DKi8gNHuHBoRCM02rK9FsrixHj87dIi2lP4ONeiKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=q2F+hZ2s1FcQekhq0Mjm8g+vBV5buzDjQcFxUknlCCM=;
	b=BmqIdRhDHjp5xI1kw3YjFaf7qEAVfkMy3YJUqezFYsIsm4FnOlcTQzS87mHOt6bhnswK
	 Y4wKnnw2+BWMZjv+/JMqZQyJRcXFMBHDP6eQd8N7GnkOQDAPlYd3Ah02ITCWnR0sU567g
	 6UabKb+c4KUniB2P0ehBKax/D+/IR+oH34vWKogG38LI/fbEZBq4D3xA+LBnMW+mCmIG/
	 wPFZHVq7bTla5n/0/lOePjjuJ9EfjbFovrGdLltLSYRAemLjXUkCXdZUEfrISA+CbBDqQ
	 JEmNZpf+y+pNnakIwXN+BR6LfQD3TaKF8/a1iIie2d3E1DomTv7gCW/8j8qOQhA/uSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlyVTf74;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D20C606A687
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 21:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D20C606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlyVTf74
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so3576154eec.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 13:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795209271; x=1795814071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q2F+hZ2s1FcQekhq0Mjm8g+vBV5buzDjQcFxUknlCCM=;
        b=QlyVTf742k4U/rjm8UAn1WGc4emJ4bOl20MgQT+w8xAtAWUVeOBYs3F9k1SNDIeaQq
         /a2AYhoN4V/bSfcJhf2HHEBhMRyJrVPT3r2+m8OT7nKHJlfRdZNTFVLIx9H7UZAD5+YQ
         dgiA3E6NPwl3ipTAwLmWTMdTZFE3ygR4vQfEDT4+cY3yZvewKUr0D3fvwYEtAnK1VCf0
         7wGYM+LJyJKe4vpdgUaqq6LWRfNmy0FbVlSH7LdSZJrFldIxvXwZ3PCOPvKdt6CO9f0F
         VltEfyy6BUN9QTpAKrSq2J3GNJyGaB+afturQOKnQkc5J4jUV2u6TLS9hvNGVUcqWhZ2
         5CnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209271; x=1795814071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q2F+hZ2s1FcQekhq0Mjm8g+vBV5buzDjQcFxUknlCCM=;
        b=AfwS2uGPRa3WXk+C0jpoieHZhIDfd9GytwCDs7ZeGJ9UUvQrjZ5kgp9vd148KzsBw6
         7JroIdxThFb7AJJ3pONynVxNeMj31rG5Akhwn7Lb2WwfDvfh700fN99s0kWj/C4ATgGR
         cjP434YbagR4tdpXEWB3GhdpEAGRhUJciqSeAQWv0MBFEUUgWkLuG7Grxooo6q4IIWfv
         aowMpr8JBCBYlmRc+lY3AG2G1EmP1OGCi2DvhvefXK7fIlrtcOEXOD8e7y/n1JQ95CuV
         ue4p6eIQcn2KLZZ9bxx2KL2Y8kZuXuSgrUNjc7hvZzQQI/hRjUOrl4HotEZLfxQRP7KZ
         ning==
X-Gm-Message-State: APuU4Z9VtccFalGJsgNy7eMt8fuSRVs14j1PwenynsblRyHYCnHWuxPE
	Gb9pGe143Ek0gVmk0ByA6VQ9RIVQ+lgHAue3UCN8SkDtG+QlgWZ3CT3wg1hP+gICWP7i
X-Gm-Gg: AZFdTZdjeh7birIiFxqbu7rENBhTzRVOl/MNOv+Zav8L5AS4P2AXf0tLdAAdLuGxbQ6
	ghd9bAqouxQbo+qqBDLaIhCEZvzNNTWeYQj7i41/ppAus68x+mkfKljmfO8iApQ/oEGqWkDrqcR
	piWZcLkpb7kK10L2q8af5mQBdqrwSk2vBWnLJjdfcXXqn3RbC5Xvy2ddnGriZdrApUELT0nxjLu
	8d//cjGpj670cu/0V1sy/5rUiyUD+8zwnS1tfgqiXfVZ6cc1wNrTH0j+JW+rb38DS8sfJ0CiaQz
	1DHsHJK7mkL/C7yVcO8AryezD41GDahYLh5iWv+brCHbRqpVlvug7KZXAMIFui9Chsn525kpg+C
	gVujhurZxSrGIJNkuRZvKkGtTAILa3yWFazrWPWkwQXLOL21eJwdvfE7917hG8W5e/ieGoMGT4R
	b08FsV2DXWgt8OWzvEG2pUUrsdrls092uk5ZWrbJBOPDGlZK6dEIZ4+U9WoN2OCcwlzf263Bnfs
	jrDbtmWbyY/IvXxxbi8NCkRcbxmdkDa/WqyFYMdpNmFzV0TxlOtRWhUYOpE/8HFVbq1VTZgQZF2
	U8oXEenVo4XA0e+OMf4gPNUNCHZi+seHr8bUoWicDIplAEluIW8Nb3e7BkBUrASzvEYd+HP7WAt
	6iMMyPNwL8BFc/RvnuQ==
X-Received: by 2002:a05:7301:a0d:b0:368:2548:c08b with SMTP id 5a478bee46e88-3856f254a17mr4787099eec.21.1795209270227;
        Fri, 20 Nov 2026 13:14:30 -0800 (PST)
Received: from ryan.localdomain ([171.76.222.148])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm13843126eec.5.2026.11.20.13.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 13:14:29 -0800 (PST)
From: Mohammed Rayan <mohammedrah1289@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	Bamvor Jian Zhang <bamv2005@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Mohammed Rayan <mohammedrah1289@gmail.com>
Subject: [PATCH] selftests: gpio: Reject empty simulator names
Date: Sat, 21 Nov 2026 02:43:39 +0530
Message-Id: <20261120211339.79567-1-mohammedrah1289@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The gpio-sim selftest checks that chip_name and dev_name are nonempty,
but the command substitutions in both checks are unquoted. If a read
produces no output, the shell removes the empty argument and leaves
"test -n", which succeeds instead of reporting the missing name.

Quote the substitutions so that an empty result fails the checks.

In a disposable QEMU guest, the original and modified scripts both
passed normally. With empty output or a failed read injected for each
attribute using a userspace wrapper, the original script passed and the
modified script failed as expected.

The issue was investigated with Codex assistance.

Fixes: 1d96b8f635d9 ("selftests: gpio: add test cases for gpio-sim")
Signed-off-by: Mohammed Rayan <mohammedrah1289@gmail.com>
---
 tools/testing/selftests/gpio/gpio-sim.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/gpio/gpio-sim.sh b/tools/testing/selftests/gpio/gpio-sim.sh
index bbc29ed9c60a..2c9e354fe9ed 100755
--- a/tools/testing/selftests/gpio/gpio-sim.sh
+++ b/tools/testing/selftests/gpio/gpio-sim.sh
@@ -181,7 +181,7 @@ echo "1.1. Chip name is communicated to user"
 create_chip chip
 create_bank chip bank
 enable_chip chip
-test -n `cat $CONFIGFS_DIR/chip/bank/chip_name` || fail "chip_name doesn't work"
+test -n "`cat $CONFIGFS_DIR/chip/bank/chip_name`" || fail "chip_name doesn't work"
 disable_chip chip
 remove_chip chip
 
@@ -196,7 +196,7 @@ echo "1.3. Device name is communicated to user"
 create_chip chip
 create_bank chip bank
 enable_chip chip
-test -n `cat $CONFIGFS_DIR/chip/dev_name` || fail "dev_name doesn't work"
+test -n "`cat $CONFIGFS_DIR/chip/dev_name`" || fail "dev_name doesn't work"
 disable_chip chip
 remove_chip chip
 
-- 
2.34.1

