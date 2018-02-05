From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] pin control bulk changes for v4.16
Date: Mon, 5 Feb 2018 09:19:05 -0800
Message-ID: <CA+55aFxhUDTW_Pa9-+jmXhNDDTy5nrkiSaswxRTHh7u+j8gnOA@mail.gmail.com>
References: <CACRpkdaTv4NBrRXeJE6dVi4W88+LZdsTCSzTHi0vdcKMW3Qfmw@mail.gmail.com>
 <CA+55aFzMBptQt-QHMR0MM9MA3=1rxcf8ca5qHxrf4Mm0ZobE_A@mail.gmail.com>
 <b82adbc32e4444debb947582d3a8291c@AcuMS.aculab.com> <CA+55aFxdK3CJiAN_yytM7nYubYOeShvCNFGpEU9SR1HC0b8WiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFxdK3CJiAN_yytM7nYubYOeShvCNFGpEU9SR1HC0b8WiQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Laight <David.Laight@aculab.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 5, 2018 at 8:55 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> End result: opening a file - whether it exists or not - doesn't
> actually go down to the filesystem at all when things are cached. My
> kernel profiles also show that very clearly, there's absolutely no
> filesystem component to the build at all (but there is a noticeable
> VFS component to it, and __d_lookup_rcu is generally one of the
> hottest kernel functions along with the system call entry/exit code).

Note that when I do kernel profiles of kernel builds, I do it mostly
for the "everything is already built" case, so the real footprint for
much of my profiles is actually mostly "make" doing millions of
open/stat calls.

Because once you actually build things, the kernel is almost not
noticeable any more. It's all gcc. And people always say that it's
optimizations that are expensive, but from the profiling I've done of
user space, a _lot_ of time is spent in just parsing and reading the
data.

In fact, having just re-done this, the top function in profiling is
"_cpp_lex_token()" at 3.4% of overall time for my test kernel build.

That matches my experience from sparse: the real overhead in a
compiler is just the stupid lexing/parsing. Cache misses galore, and
there's nothing really smart you can do about it.

Once you get to optimization, you can do smart things like hash the
SSA representation to do CSE cheaply etc clever data structures. But
lexing and parsing the tree is reading text and allocating and
generating the internal representation, and it's just "work". Lots of
it.

And that is why trying to avoid unnecessary header includes matters so
much. Because the front-end really does matter for compiler
performance.

(And it's at least partly why C++ is such a pain to compile, and why
C++ people want pre-compiled headers etc. You can't just do a forward
declaration of a struct type, and you get header inclusion from hell
when you have "clever" classes and inheritance etc. C++ build times
tend to be really nasty as a result).

                  Linus
