Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593649;
	b=ggVXWdyqJGl5/w54HS7v4/ygV54r2zkETs9TFV1KIaSFnXXKKt0Bs3RMBiVbK+RsnhmJ
	 HcuMRBa6KQHcCzaD0WmSBhB18EFiVwOp+JSRKIhzjBkl2mTkQ1bGx1ajKOu8jU4FVmR6X
	 B6BqRBsxJJDW+7vbuo/RSGhfVP6rpEYy1JW2RhStMHsQxbsqwww0jPuiaFl/1NOM45Lbq
	 qiB2emWdK190ZfRYgXc6Zzz6hlH2kDLWc+Xz2UGK2Ol2kwKclWVyp1R7ADUNjw7eUMITu
	 pRBg5AAE3iI3q3IsAWozbfx2iz/ovnVE/Y7f8vn1LYKFDkJnvEhJIePbCeSIeUg8OqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=5tReWyD7IcrkzHAZpb6sFX1MIOB68D11Ms6wecdNbbA=;
	b=nQZELv0avp2PsOmhit4VW9R4jMB6Tix9AvrNdBwbrWEbBxAmWWayXA9032S6jcRzCZty
	 nVPd3F5FhlhvryAvTA2xG9uFeAMZ/Dav1jGtUvnj34BPWPCU7565dPgrAYoR2Iwy73q/M
	 FlqI3OiSwjHPRZePf44Ap9+3+tpeaJB7+wGTVlXNz73tPYlLFN4O8SP38/eTOV2rlGLSK
	 STZ64Nneqdm68G0apCbHjn4buXtbw589+ygJKDS4kfQSi2x904Wysk018sDuOXlevsoZd
	 bUpEAev1lUikhDwdB9yYd8rNamoB5FLxPQME43ZU03AZ6PiNEUyJRHVXs8C917JgfvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJLheGLl;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1475606A31E
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 08:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1475606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJLheGLl
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38699cf08dfso6362665eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 00:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593648; x=1796198448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5tReWyD7IcrkzHAZpb6sFX1MIOB68D11Ms6wecdNbbA=;
        b=tJLheGLlOMZaur6Nqe2i9wJBcStY9bZFGp5N6/ysJ5yOHu7meZcIrFO2o1FkIVt0uf
         2Ohc9eALC22SFEKbF4TR30+8gRJEsTVs5gvDv+kmfE0bHLj/1NahseNFGhT2BE/txC1/
         Kaxs519KUq+fvxNjPHm26phgHrf2V5gfp/odIAJ4Ejr8wIsL6uFks2a5yy3uWHZcNiNz
         /yiXqCJ3Z/Vsu0AlON5b2CZ96ajkl1ETtCnL+F3uu+HK+nWyUSgspRb+sNCZSUXW1NOz
         zHRcugd+s+v6Tm4c+Ch7Gd/WBBoX4OssNtI/SFPELmNLM01QK8jFFXOgBCkovKBeQLk8
         Gu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593648; x=1796198448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tReWyD7IcrkzHAZpb6sFX1MIOB68D11Ms6wecdNbbA=;
        b=eyZvE1mrMOFeNWmbuyiyg8NWJl89GFw1pvHf7wPd+8CK001YVGgsA/Z2Vjk+e7eFSC
         7zTDpU+WDgwAAJQrirVU43IzZw+8sW35wnkWyF3h+AWITvFncM8FxubXpDhNlMz1Z18c
         nagtznC8ICh45WMWNyWBXP8dP2snqbdj5vcTmYrRKN/edpPRfRK5aidH6Xrrbj43SHBy
         GeTvciJk8/pyi1re1IbvI6ULLVWVpDUfPbx4KHGhH+OQNFGsCw9Bif/YShosQVwq3nfa
         3P5G2+O2dNKBQ07gXWE06q95Zj2gKDhA+KWEBB28SjpL4qIQGVHoRWbs+XvWE8NX6hBM
         aGOw==
X-Gm-Message-State: APuU4Z/nwr8Kd9sfFtMLMBkMHyU0tBBdjBXtD+wBKhUYUPzHqUYVtl7c
	3sYGDBoa6XqzCh/yDoatqE5c1Pgd9TZ9o1X/g0HIIQV74Lxzqp9XeBq/B79u2J73
X-Gm-Gg: AZFdTZdEfzfVCycnP7H0ENZqOTWgEbtge99GB2bHsNVVxVLorJnsa1YTZFhTjVcq8eH
	jKXXeBdSIbKSrSZsonMm6k5+K2bAivSQd6uz8VcxdA/+jEU1IMEc5Z2tf2e82BbBUUCq6xyp9KQ
	NLW0ykAkvaKBCFGWRCdfzbeIdFogzGmajUtqtufbc9sv0qHQ5Rd5ljJpMwME0yIcIauAF/a7rz0
	FXoonXdIk1mCg2kokox+oSe7ecI3VAuG+Wov7DkKLHGtX7i1xbtCjCRvFU4jSP4vSOIoUjT/6ym
	Wsogs+97fZgh7udFS1oLUamBh44eZAmCRrwuIULFzNpfm7wMqfAvzhDNaEnM/3uOSI6qcIw52Q8
	/Esnk9TW1f0hg6O3LYuJy6LDFTDqT3xD+dbv+1xXNE8w3VOTattNfDrtJtQoEEF9djZ0Mb7voga
	UNR7jWrZWj0rnen00mdK7o+bjjrtM4UZuwOZzZHjIDimMRsdwVrmgSnJVcsDl/XLQNhzwxgdR08
	vQE2d0D7lG43tUc3RlS/U3lQ7Z491WEmFzz6izlyUR3p3P6Hr0zmNhplxPx907Mp2BfTWDzpEwT
	evYM2uA5uPxRhaIGvi/WTGvMs1hhr0ddKJsLQg0uwxHpBIxmNhtvTWMtJgHG9aUrmmC9MS+Q9la
	FDZdU86Wn+y6j0LrKJ1FsyaeR81uWIC5WeH9V1h2KcGLRwDGmtw+EKzrir8f+DxtMO6ql3yEBv7
	FF/c/dbL9eWkR1KFNdToqaKSHk971fDw6ansxpUFNFRhr7mm5pWVIwJlYwfQnFYwNyYcVRNeBWW
	Erm+Er3k4GMJ7LIe/yUpTzhy3JeuLDR67gaHlr4fkth6KNJhhcDUcEHOc5/TC31H0dbpOM=
X-Received: by 2002:a05:693c:87d6:20b0:386:bc19:6a30 with SMTP id 5a478bee46e88-386bc196d10mr6233219eec.20.1795593647529;
        Wed, 25 Nov 2026 00:00:47 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm18408101eec.9.2026.11.25.00.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH libgpiod 0/2] dbus: client: tests: fix racy gpiocli monitor tests
Date: Wed, 25 Nov 2026 00:00:43 -0800
Message-ID: <20261125080045.2410076-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.56.1
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

From: Khem Raj <khem.raj@oss.qualcomm.com>

test_monitor_all_lines_on_request and test_monitor_multiple_lines_by_name
toggle one line twice, with another line in between, before reading the
monitor output. gpio-sim can deliver both changes of the first line as
one interrupt, the rising edge is lost and the tests fail intermittently.
These two patches make the tests wait for each event before triggering
the next one.

Running gpiocli-test.bash in a qemux86-64 guest (kernel 7.2.15) whose
vCPUs were pinned to one host CPU and kept busy, it failed in 7 of 10
runs without these patches (both tests fail) and passed 10 of 10 runs
with them. Without the CPU contention both variants passed 30 of 30 runs.

Khem Raj (2):
  dbus: client: tests: wait for each event in
    test_monitor_all_lines_on_request
  dbus: client: tests: wait for each event in
    test_monitor_multiple_lines_by_name

 dbus/client/gpiocli-test.bash | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

