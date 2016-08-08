clean:
	rm -rf *.egg-info
	rm -rf build
	rm -rf dist

tag-release:
	sed -i "/version_string =/c\version_string = '$(v)'" setup.py
	git add setup.py && git commit -m "Automated version bump to $(v)" && git push
	git tag -a $(v) -m "Automated release of $(v) via Makefile" && git push origin --tags

package:
	rm -rf build
	python setup.py clean
	python setup.py build sdist bdist_wheel

distribute:
	twine upload -s dist/gittle3-$(v)*

release:
	$(MAKE) tag-release
	$(MAKE) package
	$(MAKE) distribute
