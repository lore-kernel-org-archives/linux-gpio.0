Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456673;
	b=2vcFn7yLALbMS7HiD2dSvk294kpY1d994DBlTcLtzN5kN6i/g6VUXofrr0QrAYhiPwXT
	 LvIlPYUz5qLF6rLRQ82OAMIZNjwTKfjwI6DDOyABqSLH5Ak4fatFEOjrEegnAxPvXGgMG
	 iuJvaGhneSLp5Et7WG0f6KSC4uPhEzQK7bsc4CbanDsj0c6j+p7jXm6WlJA4v5vFGEEQD
	 kw5u2W4a33XCp2AOKJHzXcD9zWl9C9RyGI0A0x0M0Ss9VwPy+CbvxikcyFz39mgvjBMVJ
	 3AKZINBbhviedbyW4VZIrmHZnSdyWqXMfELfQIN/xhyrECRwFv0z3MVhCvySzIC6mSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jstqYWhrahwopoSrtuSnn/eHxJu9h6krR7suQUTL6zg=;
	b=mzX1gvIcFwWGfKVUG/0/7zHvZholXiP/JfPms6xlFIWv4h0GMzem+TnG7wSDv3LjMYU9
	 p+33k4bP6RhkcD8u//2LF++AIY7txSKDtoBWVGZPTtfVa7cDDKgXu8mETGfe7z7v1Z9Fl
	 SQtqyLQJRbfa8VF3zCUASrf5Xlmcon3lNWgQ3z3upR7g3Rvdak7oloynmxUf0xIqfwZWq
	 0esIZ4JZjeqyWaPR44PbGljFiKsjwqvD0hnN9QU8IQFbGaOXq1D1GzPFC5R17Bhr0ZoXf
	 hESFAVcu++mxmeX5kqH+Ow51sF9mToQHU8omqzcMDec8Cfie0F2doxhxZ9PbEM/bMpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B6fXu9T0;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A16606A324
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 00:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7A16606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B6fXu9T0
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-844a8bf7e25so1674092a34.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 17:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456672; x=1793061472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jstqYWhrahwopoSrtuSnn/eHxJu9h6krR7suQUTL6zg=;
        b=B6fXu9T04jxTx5vUxPWPdqhxkX5XkMhV+sjho5N8MQK/lM6oPPgdrHDcqtg5UobohY
         K17tcXaxPw3/6xbmPjvbN3yplR9X2kZadxgVDcN48+elV7ml3r1eFYElV9eEAhoJxle8
         tGBZDV1MrMDJkh4023VyifJpPhMJAaCgDsr6ksCrYpWdKU3Nl40JuXn5ZuUiNH4RONiF
         DJq+ODBSKY63//bbmo+HhHpzntNFQNQ9jHEVMF9ebEW61TdNKYn3LlhiCsx8916anEcv
         j6KBmehbM2AbREx40Nqx3NuHNTRw8E931CbekoYVFkxO7S35q898GIqm1MGO/GaLs7yL
         355w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456672; x=1793061472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jstqYWhrahwopoSrtuSnn/eHxJu9h6krR7suQUTL6zg=;
        b=lYBpAYr5rUpvCYZDI6koXvN4QqpLP8SXkqwBVWhkgSJHZFyZuGr6MDP+eLCqcQlXRs
         K9hoZCZdn9lR/IYWy/5Rup5z7Ak6gbDfIea0WcI4K7CGHvii4dupsjqQgAz7xnPC/Xlz
         zxuc6gPbWeXtxVrDYuiGgjXhccD9MLW3cTAKe5Z0FBE4r63C+G+FZJeHwZHp3exF1MTk
         0YXCJeRU5tqtrQlQZt2TJr8kwPmGv5ZTXzc+Xx1NpUGsc4MI44WNCEtbNLBeTE/CCtQ/
         NZ04Ru/7AQGfq0uEh2MrTnFOr6KMawXLldGlE3YkXZz4I4HN/U45XdLzFA80FHYelDwJ
         hKIQ==
X-Gm-Message-State: AFq9FYIgz9CNFuVQG5imsH8IQXqQ+WvRZwi4lOj+tEorUjqdfl8iX3Ra
	QlD/I3M/AOGtVqKjYsYl8qNMALoTSpAV3LdDBUiN0O7fBYWi30GMCjogGtdmdA==
X-Gm-Gg: AYBFou3wm+q1MDQ3y2ZYne3klK/pBEQGRHGedunqJRrD4/4WHeH1FEjCNjNo64WTFrD
	R5qS1inaUGp3iBtsCuM6uu2MLuJmeorNjeUSdT2AHES9+SrpWufEsnZ0HXgM4T5aAmAXG+VG04n
	nCPw8AZHraPNsbaRzxv4XU/ivqo62RwZ9SKrkgST4hY+Nh7mAAy8N9P/I68U12vVSeXlQEnR0zf
	3ve5w6HrFrxFJ4Q8vDB4765Df382ArJgbKs+t9+EGezSanNZNn/ITC9rWB72RwittQ8tPy18QuF
	t/X0M7Ny3kDyiF3TxM9V66qlyApT2TOUX6vitjvzI/4bzD9bT+PC6rJVI7wc+tqoKCO/QpJHApi
	uJvn0qlU/WErlc2UGS9qdMPsgj6bAfZ6CMFX7T2HbA5wBzcLWS2tDiHcAiEjtXCf/ALXLtWIy9w
	PNZ3ASht7c4ZCJ+UQnqcYyZOwjobIZwaoFwUFQDSQD0dJNSFsbkL3DqbFr/IHdVxcV62Os7avge
	YJAsV7q5dNOpOrwgdWi8tuVUdpSrUfds+Ws
X-Received: by 2002:a05:6830:67cf:b0:843:56a6:c881 with SMTP id 46e09a7af769-844fdeacd55mr9048268a34.8.1792456671799;
        Mon, 19 Oct 2026 17:37:51 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm10373383a34.0.2026.10.19.17.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:37:49 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 04/14] bindings: python: setup: use a context manager to manage files
Date: Mon, 19 Oct 2026 19:37:18 -0500
Message-ID: <20261020003728.13669-5-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020003728.13669-1-vfazio@gmail.com>
References: <20261020003728.13669-1-vfazio@gmail.com>
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

Previously, a number of places in setup.py did not use a context manager
to manage the lifetime of the underlying file descriptor for reading and
writing the `libgpiod-version.txt` file.

While the previous method works, it relies on the returned file object
being assigned to a temporary Python object that has its refcount
decremented immediately after statement execution. This then relies on
the file object's finalizer to close the underlying handle which can
emit ResourceWarnings:

  /bindings/python/setup.py:193: ResourceWarning: unclosed file <_io.TextIOWrapper name='libgpiod-version.txt' mode='w' encoding='UTF-8'>
    open("libgpiod-version.txt", "w").write(LIBGPIOD_VERSION)

Now, we specifically use a context manager to close the file descriptor
when done to explicitly manage its lifetime.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/setup.py | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index 7c9a03f..4297615 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -87,10 +87,11 @@ def fetch_tarball(func: Callable[[T], None]) -> Callable[[T], None]:
         # If the version in "libgpiod-version.txt" already matches our
         # requested tarball, then skip the fetch altogether.
         try:
-            if open("libgpiod-version.txt").read() == LIBGPIOD_VERSION:
-                log.info("skipping tarball fetch")
-                func(cmd)
-                return
+            with open("libgpiod-version.txt") as f:
+                if f.read() == LIBGPIOD_VERSION:
+                    log.info("skipping tarball fetch")
+                    func(cmd)
+                    return
         except OSError:
             pass
 
@@ -185,7 +186,8 @@ def fetch_tarball(func: Callable[[T], None]) -> Callable[[T], None]:
                     cmd.distribution.metadata.license_files = [LICENSE_FILE]  # type: ignore[attr-defined]
 
         # Save the libgpiod version for sdist
-        open("libgpiod-version.txt", "w").write(LIBGPIOD_VERSION)
+        with open("libgpiod-version.txt", "w") as f:
+            f.write(LIBGPIOD_VERSION)
 
         # Run the command
         func(cmd)
@@ -217,7 +219,8 @@ class build_ext(orig_build_ext):
         # Try to get the gpiod version from the .txt file included in sdist
         libgpiod_version: str | None
         try:
-            libgpiod_version = open("libgpiod-version.txt").read()
+            with open("libgpiod-version.txt") as f:
+                libgpiod_version = f.read()
         except OSError:
             libgpiod_version = LIBGPIOD_VERSION
 
-- 
2.43.0

